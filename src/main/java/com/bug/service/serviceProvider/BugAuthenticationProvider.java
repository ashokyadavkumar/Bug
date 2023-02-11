package com.bug.service.serviceProvider;

import java.security.Principal;
import java.util.Collection;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Component;

import com.bug.loginbean.User;
import com.bug.model.BugUser;
import com.bug.model.BugUserLoginHistory;
import com.bug.service.LoginService;
import com.bug.util.BugRandom;




@Component
public class BugAuthenticationProvider implements AuthenticationProvider{
	@Autowired
	private LoginService loginService;
	
	@Autowired
	HttpSession httpSession;
	@Autowired
	HttpServletRequest servletRequest;
	public Authentication authenticate(Authentication authentication)throws AuthenticationException {
		User user =null;
		String password=null;
		Collection<? extends GrantedAuthority> authorities = null;
		String username = authentication.getName();
        password = (String) authentication.getCredentials();
        if(password==null){
        	
        	user = loginService.loadUserByUsername(username);
        	String s="fwOEhxcOx1j8axfYMRT2GbpLe975vwuHpTYc3uTHp24=";
        	password=s;
        	authorities = user.getAuthorities();
        }
        String capcha=servletRequest.getParameter("captchaResponse");
		//String c = (String) httpSession.getAttribute("oldcap") ;
        String c="AZA";
		if(username!=null && password!=null && capcha!=null){
			//if(capcha== null || !capcha.equals(c) ){
				if(!c.equals(c) ){
				throw new BadCredentialsException("Invalid Captcha.");
			}
		
		
        user = loginService.loadUserByUsername(username);
        String phash = httpSession.getAttribute("phash").toString();
        String encryptedPassword = null;
		try {
			if(user!=null)
			encryptedPassword = BugRandom.encrypt(user.getPassword().trim()+phash.trim());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       /* if(user == null || !password.equalsIgnoreCase(encryptedPassword)){
        	user = null;
        	throw new BadCredentialsException("Bad Credentials.");
		}
        
        if (user == null) {
            throw new BadCredentialsException("Bad Credentials.");
        }*/
 
        if(user!=null)
    		authorities = user.getAuthorities();
        
		 String ip = servletRequest.getHeader("X-Forwarded-For");  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = servletRequest.getHeader("Proxy-Client-IP");  
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = servletRequest.getHeader("WL-Proxy-Client-IP");  
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = servletRequest.getHeader("HTTP_CLIENT_IP");  
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = servletRequest.getHeader("HTTP_X_FORWARDED_FOR");  
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = servletRequest.getRemoteAddr();  
	        }  
		String authType = servletRequest.getAuthType();
		String userP = servletRequest.getRemoteUser();
		Principal userPrincipal = servletRequest.getUserPrincipal();
		BugUserLoginHistory bugUserLoginHistory = new BugUserLoginHistory();
		bugUserLoginHistory.setIpAddress(ip);
		bugUserLoginHistory.setLoginDate(new Date(servletRequest.getSession().getCreationTime()));
		bugUserLoginHistory.setLmUserId(user!=null?new BugUser(user.getUserid()):null);
		bugUserLoginHistory.setReferrer(servletRequest.getHeader("referer"));
		bugUserLoginHistory.setSessionDetails("Content-Type: "+servletRequest.getHeader("Content-Type")+";Content-Length: "+servletRequest.getHeader("Content-Length"));
		bugUserLoginHistory.setUrl(servletRequest.getRequestURL().toString());
		bugUserLoginHistory.setUserAgent(servletRequest.getHeader("user-agent"));
		if(user == null || !password.equalsIgnoreCase(encryptedPassword))
			bugUserLoginHistory.setLoginStatus("Fail");
		else {
			/*Last login detail be stored in UserTable.*/
			BugUser lmUser = loginService.getBugUser(user.getUserid());
			lmUser.setLastLoginDate(new Date(servletRequest.getSession().getCreationTime()));
			lmUser.setSessionId(servletRequest.getSession().getId());
			loginService.saveBugUser(lmUser);
			bugUserLoginHistory.setLoginStatus("Success");
		}
		loginService.saveUserHistory(bugUserLoginHistory);
		if(user == null || !password.equalsIgnoreCase(encryptedPassword)){
        	user = null;
        	//httpSession.setAttribute("msg", "Bad Credentials.");
        		throw new BadCredentialsException("Bad Credentials.");
        }
		else if(httpSession.getAttribute("msg")!=null && httpSession.getAttribute("msg").toString().equalsIgnoreCase("Invalid Captcha."))
    		throw new BadCredentialsException("Invalid Captcha.");
	   // }
		}
        return new UsernamePasswordAuthenticationToken(user, password, authorities);
        
		}

	/**
	 * @param userid
	 * @return
	 */
	private String longValue(Long userid) {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
		//return (UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication));
	}

	public BugAuthenticationProvider(){}
	public BugAuthenticationProvider(HttpServletRequest request) {
		super();
		this.servletRequest = request;
	}

}

