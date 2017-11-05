package com.csf.web.filter;

import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by changqi.wu on 17-8-26.
 */
@WebFilter
public class ResponseFilter  implements Filter {

    private static final Logger logger = Logger.getLogger(ResponseFilter.class);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        logger.info("init response filter");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        logger.info("do response filter");
        HttpServletRequest request = (HttpServletRequest)servletRequest;

        filterChain.doFilter(servletRequest, servletResponse);
        HttpServletResponse  response = (HttpServletResponse)servletResponse;

    }

    @Override
    public void destroy() {
        logger.info("destroy response filter");
    }
}
