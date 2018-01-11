package com.csf.web.filter;

import com.csf.web.constants.OAConstants;
import com.csf.web.entity.User;
import com.csf.web.entity.UserRole;
import com.csf.web.service.ServiceUtil;
import com.csf.web.util.JsonUtils;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import sun.net.httpserver.HttpServerImpl;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by changqi.wu on 17-8-26.
 */
public class SessionFilter implements HandlerInterceptor {
    private static final Logger logger = Logger.getLogger(SessionFilter.class);

    private static Set<String> exclude_path = new HashSet<>();
    private static Set<String> include_path = new HashSet<>();

    static {
        exclude_path.add("/");
        exclude_path.add("/index");
        exclude_path.add("/home");
        exclude_path.add("/web/user/login");
        exclude_path.add("/web/user/register");
        exclude_path.add("/user/login");
        exclude_path.add("/user/regist.html");

//        exclude_path.add("/web/maintain/more");
//        exclude_path.add("/video/more.html");
//        exclude_path.add("/web/device/more");
//        exclude_path.add("/news/more.html");
//        exclude_path.add("/web/device/new");
//        exclude_path.add("/web/maintain/new");
//        exclude_path.add("/news/more.html");
//        exclude_path.add("/web/news/list");
//        exclude_path.add("/web/news/detail");
//        exclude_path.add("/web/device/list");
//        exclude_path.add("/web/device/detail");
//        exclude_path.add("/web/video/list");
//        exclude_path.add("/web/video/detail");
//        exclude_path.add("/web/maintain/list");
//        exclude_path.add("/web/maintain/detail");

        include_path.add("/cust/work");
        include_path.add("/cust/my");
        include_path.add("/cust/message");
    }

    private boolean checkExPath(String path) {
        if (exclude_path.contains(path)) {
            return true;
        }
        return false;
    }

    private boolean checkInPath(String path) {
        if (include_path.contains(path)) {
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
        if (checkExPath(httpServletRequest.getRequestURI())) {
            return true;
        } else {
            User user = (User) httpServletRequest.getSession().getAttribute(OAConstants.SESSION_USER);
            if (user == null) {
                Cookie[] cookies = httpServletRequest.getCookies();
                String usename = null;
                String password = null;
                for (Cookie ck : cookies) {
                    if (OAConstants.COOKIE_USER_NAME.equals(ck.getName())) {
                        usename = ck.getValue();
                        continue;
                    }
                    if (OAConstants.COOKIE_USER_PASSWORD.equals(ck.getName())) {
                        password = ck.getValue();
                        continue;
                    }
                }
                user = ServiceUtil.login(usename, password);
                if (user == null) {
                    user = new User();
                }
                httpServletRequest.getSession().setAttribute(OAConstants.SESSION_USER, user);//创建临时用户 用于无登陆访问首页
            }
            if (checkInPath(httpServletRequest.getRequestURI())) {
                if (user.getId() == null) {
                    String query = httpServletRequest.getQueryString() == null ? "" : httpServletRequest.getQueryString();
                    String redirect_url = httpServletRequest.getRequestURI() + "?" + query;
                    logger.info(">>>> query is :" + redirect_url);
                    httpServletRequest.getSession().setAttribute("redirect_url", redirect_url);
                    httpServletResponse.sendRedirect("/index");
                    return false;
                }
            }
        }
        return true;// 只有返回true才会继续向下执行，返回false取消当前请求
    }

    public void session(User user, HttpServletRequest request,HttpServletResponse response){
        String role = UserRole.getRole(user.getRole()); //获取role
        HttpSession session = request.getSession();

        store(session, response, user, role);

        if ("购机客户".equals(user.getRole())) {
            String device = user.getDevice();
            Boolean right = ServiceUtil.existDevice(device);
            session.setAttribute("cust_right",right);
        }
    }

    public void store(HttpSession session, HttpServletResponse response, User user, String role) {
        session(session, user, role);
        cookie(response, user, role);
    }

    public void session(HttpSession session, User user, String role) {
        session.setAttribute(OAConstants.SESSION_USER, user);
        session.setAttribute("role", role);
    }

    public void cookie(HttpServletResponse response, User user, String role) {
        Cookie cookie = new Cookie(OAConstants.COOKIE_USER_NAME, user.getUsername());
        cookie.setMaxAge(30 * 24 * 3600);
        cookie.setDomain(OAConstants.SERVER_HOST);
        cookie.setPath("/");
        response.addCookie(cookie);
        cookie = new Cookie(OAConstants.COOKIE_USER_PASSWORD, user.getPassword());
        cookie.setMaxAge(30 * 24 * 3600);
        cookie.setDomain(OAConstants.SERVER_HOST);
        cookie.setPath("/");
        response.addCookie(cookie);

        try {
            cookie = new Cookie(OAConstants.COOKIE_USER, URLEncoder.encode(JsonUtils.toJson(user), "utf-8"));
            response.addCookie(cookie);
            cookie.setDomain(OAConstants.SERVER_HOST);
            cookie.setPath("/");
            cookie.setMaxAge(30 * 24 * 3600);
            response.addCookie(cookie);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        cookie = new Cookie(OAConstants.COOKIE_USER_ROLE, role);
        cookie.setDomain(OAConstants.SERVER_HOST);
        cookie.setPath("/");
        cookie.setMaxAge(30 * 24 * 3600);
        response.addCookie(cookie);
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
