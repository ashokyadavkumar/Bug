package com.bug.handler;

import java.io.IOException;

import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.bug.loginbean.User;
import com.bug.model.BugUser;
import com.bug.model.BugUserLoginHistory;
import com.bug.service.LoginService;

@Component
public class BugAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		HttpSession session = request.getSession();
		session.removeAttribute("msg");
		/*Set some session variables*/
		User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();  
		session.setAttribute("uname", authUser.getUsername());  
		session.setAttribute("authorities", authentication.getAuthorities());
		session.setAttribute("userId", authUser.getUserid());  
		
		/*Set target URL to redirect*/

		//String capcha=request.getParameter("captchaResponse");
		//String c = (String) session.getAttribute("oldcap") ;
		 String c="AZA";
		if(!c.equals(c) ){
	    	String targetUrl = "/login"; 
			try {
				session.setAttribute("msg", "Invalid Captcha.");
				redirectStrategy.sendRedirect(request, response, targetUrl);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}    
	    }
	    else
	    {
	    	session.removeAttribute("msg");
	    	try{
		String targetUrl = determineTargetUrl(authentication);
		
		
		
		if(targetUrl.equalsIgnoreCase("/")){
			redirectStrategy.sendRedirect(request, response, targetUrl);
			//throw new BadCredentialsException("No access found for the this role.");
			}
		else 
		redirectStrategy.sendRedirect(request, response, targetUrl);
	    } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   }
	}

	public String determineTargetUrl(Authentication authentication) {
		Set<String> authorities = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
		User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (authorities.contains("ROLE_USER")) {
			return "/dashboardAdmin";
		}
		
		else if (authorities.contains("ROLE_ADMIN") || authorities.contains("ROLE_PROJECT LEADER")
				|| authorities.contains("ROLE_MODULE LEADER") || authorities.contains("ROLE_TEST LEADER")
				|| authorities.contains("ROLE_DEVELOPER") || authorities.contains("ROLE_TESTER")) {
			return "/dashboardAdmin";
		}
		
		else if (authorities!=null) {
			new BadCredentialsException("Bad Credentials.");
			return "/login?error=true";
		}
		
		
		else {
			throw new IllegalStateException();
		}
	}

	public RedirectStrategy getRedirectStrategy() {
		return redirectStrategy;
	}

	public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
		this.redirectStrategy = redirectStrategy;
	}


	
	
}