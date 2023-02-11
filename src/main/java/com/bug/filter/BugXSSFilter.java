package com.bug.filter;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BugXSSFilter implements Filter {
   
     private String mode = "DENY";
     private String XSS_URL_REGEX = "^(https?|ftp|file)://[-a-zA-Z0-9+&@#/%?=~_|!:,.;]*[-a-zA-Z0-9+&@#/%=~_|]";
     String xssHeader=null;
    public void init(FilterConfig filterConfig) throws ServletException {
        //System.out.println("-------Radhe LmsXSSFilter-------");
    }

    public void destroy() {
    }
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)

        throws IOException, ServletException {
        HttpServletResponse res = (HttpServletResponse)response;
        HttpServletRequest req  = (HttpServletRequest)request;      
        String actualURL = null;
        if (null != req.getQueryString()) {
            actualURL = req.getRequestURL().toString().concat("?").concat(req.getQueryString());
        } else {
            actualURL = req.getRequestURL().toString();
        }
        if (actualURL.matches(XSS_URL_REGEX)) {
            res.addHeader("X-FRAME-OPTIONS", mode );

            res.setHeader("Cache-Control", "private, no-cache, no-store, pre-check=0, post-check=0, must-revalidate"); // HTTP 1.1.
            res.setHeader("Pragma", "no-cache"); // HTTP 1.0.
            res.setHeader("Expires", "-1"); // Proxies.

            xssHeader = req.getHeader("X-XSS-Protection");
            res.addHeader("X-XSS-Protection", "1; mode=block");
            res.setHeader("Content-Security-Policy", "default-src 'self'; frame-ancestors 'none'; reflected-xss block");
            res.setHeader("Content-Security-Policy", "frame-ancestors 'self'; reflected-xss 'block'");
            res.addHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains");
            res.addHeader("X-Content-Type-Options", "nosniff");
            res.addHeader("Access-Control-Allow-Origin", "*");
            res.addHeader("Access-Control-Allow-Methods", "POST, GET, DELETE");
            res.addHeader("Access-Control-Max-Age", "3600");
            chain.doFilter(new XSSRequestWrapper((HttpServletRequest) request), res);
        } else {
            res.sendRedirect(req.getContextPath()+"/login?error");
        }
    }
}
