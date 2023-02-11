/**
 * 
 */
package com.bug.configuration;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.authentication.ExceptionMappingAuthenticationFailureHandler;
import org.springframework.security.web.session.HttpSessionEventPublisher;

import com.bug.handler.BugAuthenticationSuccessHandler;
import com.bug.service.serviceProvider.BugAuthenticationProvider;


//@Configuration
//@Configuration
@EnableWebSecurity
@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	@Autowired
	private BugAuthenticationProvider authProvider;
	
	@Autowired
	DataSource dataSource;
	
	@Autowired
    public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authProvider);
    }
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		.antMatchers("/*").permitAll()
		//.antMatchers("/admin/**").access("hasRole('ROLE_AD')")
		
		.and().formLogin().loginPage("/login")
		.loginProcessingUrl("/j_spring_security_check")
		.successHandler(new BugAuthenticationSuccessHandler())
		.failureHandler(new ExceptionMappingAuthenticationFailureHandler())
		.failureUrl("/login?error=true").usernameParameter("userName").passwordParameter("userPassword")
		.and().logout().invalidateHttpSession(true).logoutSuccessUrl("/")	
		.and().csrf().ignoringAntMatchers("/pgi/**","/industryLicenseDashboard/**","/ilArmsDashboard/**").and()
		.headers().defaultsDisabled()
		.and().exceptionHandling().accessDeniedPage("/accessDenied")
		.and().sessionManagement().sessionFixation().migrateSession()
		.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
        .maximumSessions(1)
        .expiredUrl("/login");
		http.headers().httpStrictTransportSecurity().and().xssProtection().and().cacheControl().and().frameOptions().sameOrigin();
		http.headers().contentTypeOptions();

	}	
	
	@Bean
	public HttpSessionEventPublisher httpSessionEventPublisher() {
	    return new HttpSessionEventPublisher();
	}
	
	@Bean
	public AuthenticationManager customAuthenticationManager() throws Exception {
	  return authenticationManager();
	}
	  
}

