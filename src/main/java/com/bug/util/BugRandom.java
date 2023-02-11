package com.bug.util;


import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

import sun.misc.BASE64Encoder;


public class BugRandom {
	private static final String ALPHA_CAPS  = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final String ALPHA   = "abcdefghijklmnopqrstuvwxyz";
    private static final String NUM     = "0123456789";
    private static final String SPL_CHARS   = "!@#$%^&*_=+-/";
    
	static final String AB = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	static final String ABR = "0123456789";
	static Random rndS = new Random();
	
	public static char[] generateRandomPswd(int minLen, int maxLen, int noOfCAPSAlpha,
            int noOfDigits, int noOfSplChars) {
        if(minLen > maxLen)
            throw new IllegalArgumentException("Min. Length > Max. Length!");
        if( (noOfCAPSAlpha + noOfDigits + noOfSplChars) > minLen )
            throw new IllegalArgumentException
            ("Min. Length should be atleast sum of (CAPS, DIGITS, SPL CHARS) Length!");
        Random rnd = new Random();
        int len = rnd.nextInt(maxLen - minLen + 1) + minLen;
        char[] pswd = new char[len];
        int index = 0;
        for (int i = 0; i < noOfCAPSAlpha; i++) {
            index = getNextIndex(rnd, len, pswd);
            pswd[index] = ALPHA_CAPS.charAt(rnd.nextInt(ALPHA_CAPS.length()));
        }
        for (int i = 0; i < noOfDigits; i++) {
            index = getNextIndex(rnd, len, pswd);
            pswd[index] = NUM.charAt(rnd.nextInt(NUM.length()));
        }
        /*for (int i = 0; i < noOfSplChars; i++) {
            index = getNextIndex(rnd, len, pswd);
            pswd[index] = SPL_CHARS.charAt(rnd.nextInt(SPL_CHARS.length()));
        }*/
        for(int i = 0; i < len; i++) {
            if(pswd[i] == 0) {
                pswd[i] = ALPHA.charAt(rnd.nextInt(ALPHA.length()));
            }
        }
        return pswd;
    }
     
    private static int getNextIndex(Random rnd, int len, char[] pswd) {
        int index = rnd.nextInt(len);
        while(pswd[index = rnd.nextInt(len)] != 0);
        return index;
    }
	public static String randomUserId( int len ) 
	{
	   StringBuilder sb = new StringBuilder( len );
	   for( int i = 0; i < len; i++ ) 
	      sb.append( AB.charAt( rndS.nextInt(AB.length()) ) );
	   return sb.toString();
	}
	
	public static String randomRegistrationCode( int len ) 
	{
	   StringBuilder sb = new StringBuilder( len );
	   for( int i = 0; i < len; i++ ) 
	      sb.append( ABR.charAt( rndS.nextInt(ABR.length()) ) );
	   return sb.toString();
	}
	
	public static synchronized String encrypt(String plaintext) throws Exception
	{
		try{
		MessageDigest md = null;
		try
		{
			md = MessageDigest.getInstance("SHA-256"); //step 2
		}
		catch(NoSuchAlgorithmException e)
		{
			throw new Exception(e.getMessage());
		}
		try
		{
			md.update(plaintext.getBytes("UTF-8")); //step 3
		}
		catch(UnsupportedEncodingException e)
		{
			throw new Exception(e.getMessage());
		}
		byte raw[] = md.digest(); //step 4

		String hash = (new BASE64Encoder()).encode(raw); //step 5

		return hash; //step 6
		}
		catch(Exception e){
			StackTraceElement stackTraceElement[] = e.getStackTrace();
			throw new Exception(e);	
		}

	}
}
