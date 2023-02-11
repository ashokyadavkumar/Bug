package com.bug.configuration;

import java.util.EnumSet;
import java.util.Set;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration.Dynamic;
import javax.servlet.SessionTrackingMode;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import com.bug.filter.BugXSSFilter;

public class AppInitializer 
extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] { AppConfig.class };
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return null;
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}
	
	

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
     /*/* super.onStartup(servletContext);
        servletContext.addListener(new RequestContextListener());
        servletContext.addListener(new SessionListener());
        Set<SessionTrackingMode> modes = EnumSet.noneOf(SessionTrackingMode.class);
        modes.add(SessionTrackingMode.COOKIE);
        servletContext.setSessionTrackingModes(modes*/
           AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
         ctx.register(AppConfig.class);
         servletContext.addListener(new RequestContextListener());
         //servletContext.addListener(new SessionListener());
         Set<SessionTrackingMode> modes = EnumSet.noneOf(SessionTrackingMode.class);
         modes.add(SessionTrackingMode.COOKIE);
         servletContext.setSessionTrackingModes(modes);
         ctx.setServletContext(servletContext);
         DispatcherServlet dispatcher = new DispatcherServlet(ctx);
         dispatcher.setThrowExceptionIfNoHandlerFound(true);
         Dynamic servlet = servletContext.addServlet("dispatcher", dispatcher);
         servlet.addMapping("/");
         servlet.setLoadOnStartup(1);
         ContextLoaderListener contextLoaderListener = new ContextLoaderListener(ctx);
         servletContext.addListener(contextLoaderListener);
         FilterRegistration.Dynamic fr = servletContext.addFilter("encodingFilter", CharacterEncodingFilter.class);

         fr.setInitParameter("encoding", "UTF-8");
         fr.setInitParameter("forceEncoding", "true");
         fr.addMappingForUrlPatterns(null, true, "/*");
         FilterRegistration.Dynamic fr1 = servletContext.addFilter("xssFilter", BugXSSFilter.class);
         fr1.addMappingForUrlPatterns(null, true, "/*");
         

    }

}
