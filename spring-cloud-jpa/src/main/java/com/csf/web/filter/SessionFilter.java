package com.csf.web.filter;

import com.csf.web.constants.OAConstants;
import com.csf.web.entity.User;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by changqi.wu on 17-8-26.
 */
public class SessionFilter implements HandlerInterceptor {
    private static final Logger logger = Logger.getLogger(SessionFilter.class);

    private static Set<String> exclude_path = new HashSet<>();

    static {
        exclude_path.add("/");
        exclude_path.add("/index");
        exclude_path.add("/home");
        exclude_path.add("/web/user/login");
        exclude_path.add("/web/user/register");
        exclude_path.add("/user/login");
        exclude_path.add("/user/regist.html");
    }

    private boolean checkInPath(String path) {
        if (exclude_path.contains(path)) {
            return true;
        }
        return false;
    }

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        logger.debug(">>>SessionFilter>>>>>>>在请求处理之前进行调用（Controller方法调用之前）");

        Enumeration<String> names = httpServletRequest.getHeaderNames();
        while (names.hasMoreElements()) {
            String key = names.nextElement();
            System.out.println("request header : " + key + " value : " + httpServletRequest.getHeader(key));
        }
        logger.info(httpServletRequest.getRequestURI().toString() + " >>>>>>>>>>>>>> ");
        if (checkInPath(httpServletRequest.getRequestURI())) {
            return true;
        } else {
            User user = (User) httpServletRequest.getSession().getAttribute(OAConstants.SESSION_USER);
            if (user == null) {
                httpServletResponse.sendRedirect("/index");
                return false;
            }
        }
        return true;// 只有返回true才会继续向下执行，返回false取消当前请求
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
//        System.out.println(">>>>>  "+JsonUtils.toJson(o));
        logger.debug(">>>SessionFilter>>>>>>>请求处理之后进行调用，但是在视图被渲染之前（Controller方法调用之后）");
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        logger.debug(">>>SessionFilter>>>>>>>在整个请求结束之后被调用，也就是在DispatcherServlet 渲染了对应的视图之后执行（主要是用于进行资源清理工作）");
    }
}
