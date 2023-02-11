package com.bug.configuration;

import java.io.IOException;
import java.util.Properties;

import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.exception.VelocityException;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.format.FormatterRegistry;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.ui.velocity.VelocityEngineFactory;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.bug")
@Import(SecurityConfig.class)
public class AppConfig extends WebMvcConfigurerAdapter {
	
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");

		return viewResolver;
	}

	
	@Bean
	  public static PropertySourcesPlaceholderConfigurer propertyConfigInDev() {
	    return new PropertySourcesPlaceholderConfigurer();
	  }
	
	

	@Bean
	public MultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("utf-8");
		resolver.setMaxUploadSize(20848820);
		//resolver.setMaxInMemorySize(maxInMemorySize);
		return resolver;
	}
	

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {

		// Css resource.
		registry.addResourceHandler("/styles/**")
				//
				.addResourceLocations("/WEB-INF/resources/css/")
				.setCachePeriod(31556926);
		
		
		//For PDF Sample Documents
		registry.addResourceHandler("/document/**")
		.addResourceLocations("/WEB-INF/resources/docs/")
		.setCachePeriod(31556926);

		registry.addResourceHandler("/images/**")
				//
				.addResourceLocations("/WEB-INF/resources/images/")
				.setCachePeriod(31556926);

		registry.addResourceHandler("/js/**")
				//
				.addResourceLocations("/WEB-INF/resources/js/")
				.setCachePeriod(31556926);

		registry.addResourceHandler("/template/**")
				//
				.addResourceLocations("/WEB-INF/resources/template/")
				.setCachePeriod(31556926);

		registry.addResourceHandler("/fonts/**")
				//
				.addResourceLocations("/WEB-INF/resources/fonts/")
				.setCachePeriod(31556926);
		registry.addResourceHandler("/velocity/**")
		//
		.addResourceLocations("/WEB-INF/classes/velocity/")
		.setCachePeriod(31556926);
		

	}
	@Override
	public void addFormatters(FormatterRegistry registry) {
	    registry.addConverter(new DateConverter());
	}
	
	   @Bean
	    public SimpleMappingExceptionResolver exceptionResolver() {
	        SimpleMappingExceptionResolver exceptionResolver = new SimpleMappingExceptionResolver();
	        Properties exceptionMappings = new Properties();
	        exceptionMappings.put("org.springframework.security.web.authentication.rememberme.CookieTheftException", "/login?error=sessionExpired");
	        exceptionMappings.put("java.lang.RuntimeException", "/AccessDenied");
	        exceptionMappings.put("java.lang.Exception", "/AccessDenied");
	        exceptionResolver.setExceptionMappings(exceptionMappings);
	        Properties statusCodes = new Properties();
	        statusCodes.put("/AccessDenied", "403");
	        statusCodes.put("/AccessDenied", "404");
	        statusCodes.put("/homePage","405");
	        statusCodes.put("/AccessDenied", "500");
	        exceptionResolver.setStatusCodes(statusCodes);
	        return exceptionResolver;
	    }   

	   
	   
	   
}
