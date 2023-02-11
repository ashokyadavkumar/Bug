package com.bug.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.bug.handler.BugAuthenticationSuccessHandler;
@Component
@ComponentScan("com.lms.util")
public class NswsSetContext {
	
	@Autowired
	private AuthenticationManager authenticationManager;
	@Autowired
	private BugAuthenticationSuccessHandler lmsAuthenticationSuccessHandler;
	
	public void currentUserName(String userName) {
		String determineTargetUrl=null;
		
		try{
		       UsernamePasswordAuthenticationToken springToken = new UsernamePasswordAuthenticationToken(userName, null);
			Authentication authentication	= authenticationManager.authenticate(springToken);
			
			SecurityContextHolder.getContext().setAuthentication(authentication);
			
			 if(authentication!=null){
				determineTargetUrl = lmsAuthenticationSuccessHandler.determineTargetUrl(authentication);
			 }
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
    }

}
