package com.crud;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String name = httpRequest.getParameter("name");
        
        // Skip filter for login page and static resources
        String requestURI = httpRequest.getRequestURI();
        if (requestURI.contains("LoginForm") || requestURI.contains("resources/")) {
            chain.doFilter(request, response);
            return;
        }
        
        // Check if user is authenticated
        if (name == null || name.isEmpty()) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/LoginForm");
            return;
        }

        // Continue the filter chain
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Cleanup code if needed
    }
}
