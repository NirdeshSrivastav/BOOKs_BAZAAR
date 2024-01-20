/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.auth;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sriva
 */
public class Filter_Auth implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpSession session = ((HttpServletRequest) request).getSession(false);

        if (session != null && session.getAttribute("email") != null) {
            // Session exists and user attribute is present, continue with the filter chain
            chain.doFilter(request, response);
            System.out.println("Session is already established. Proceeding with the filter chain.");
        } else {
            // Session doesn't exist or user attribute is not present, redirect to error.jsp
            ((HttpServletResponse) response).sendRedirect("http://localhost:9494/book_sbazaar.in/login-page");
            System.out.println("Session is not established or user is not logged in. Redirecting to login page");
            return;
        }
    }

    @Override
    public void destroy() {

    }

}
