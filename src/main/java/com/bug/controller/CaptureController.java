package com.bug.controller;

import java.security.SecureRandom;

public class CaptureController {
	static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	static SecureRandom rnd = new SecureRandom();
	
	String randomString(  ){
		
		int len=6;
		   StringBuilder sb = new StringBuilder( len );
		   for( int i = 0; i < len; i++ ) 
		      sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );
		   return sb.toString();
		}
	

}



