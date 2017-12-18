package com.csf.web.rest;

import com.csf.web.constants.OAConstants;
import com.csf.web.dto.APIStatus;
import com.csf.web.dto.BaseDto;
import com.csf.web.entity.Message;
import com.csf.web.entity.User;
import com.csf.web.entity.UserRole;
import com.csf.web.service.MessageService;
import com.csf.web.service.UserService;
import com.csf.web.util.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by changqi.wu on 17-8-27.
 */
public class APIService {

    @Autowired
    protected HttpServletRequest request;

    @Autowired
    protected HttpServletResponse response;


    /*****ajax response body ****/
    public BaseDto failure(Object obj) {
        BaseDto dto = BaseDto.newDto(APIStatus.failure);
        dto.setObj(obj);
        return dto;
    }

    public BaseDto ajaxResp(APIStatus status) {
        return BaseDto.newDto(status);
    }

    public static BaseDto ajaxFailure() {
        return BaseDto.newDto(APIStatus.failure);
    }

    public BaseDto ajaxFailure(String code, String message) {
        BaseDto dto = new BaseDto();
        dto.setCode(code);
        dto.setMsg(message);
        return dto;
    }

    public BaseDto ajaxSuccess(Object obj) {
        BaseDto dto = BaseDto.newDto(obj);
        return dto;
    }

    /*****ajax response body end****/

    /*****request  ****/
    public String webFailure(String code, String message) {
        request.setAttribute("code", code);
        request.setAttribute("message", message);
        return error_page;
    }

    public String webResp(APIStatus status) {
        request.setAttribute("code", status.getCode());
        request.setAttribute("message", status.getMsg());
        return error_page;
    }

    public void attr(String key, Object value) {
        request.setAttribute(key, value);
    }

    public void page(Page value) {
        request.setAttribute("page", value);
    }

    public void list(Page value) {
        List val = null;
        if (value != null) {
            val = value.getContent();
        }
        request.setAttribute("dataList", val);
    }

    public void list(List value) {
        request.setAttribute("dataList", value);
    }


    /*****request  end****/

    /******** public method *******/

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

    /***********session***************/
    public void onclick(boolean home, boolean work, boolean msg, boolean my) {
        HttpSession session = request.getSession();
        if (home) {
            session.setAttribute("action_home_png", "nav_home_focus.png");
            session.setAttribute("action_work_png", "nav_work.png");
            session.setAttribute("action_msg_png", "nav_msg.png");
            session.setAttribute("action_my_png", "nav_my.png");
            return;
        }
        if (work) {
            session.setAttribute("action_home_png", "nav_home.png");
            session.setAttribute("action_work_png", "nav_work_focus.png");
            session.setAttribute("action_msg_png", "nav_msg.png");
            session.setAttribute("action_my_png", "nav_my.png");
            return;
        }
        if (msg) {
            session.setAttribute("action_home_png", "nav_home.png");
            session.setAttribute("action_work_png", "nav_work.png");
            session.setAttribute("action_msg_png", "nav_msg_focus.png");
            session.setAttribute("action_my_png", "nav_my.png");
            return;
        }
        if (my) {
            session.setAttribute("action_home_png", "nav_home.png");
            session.setAttribute("action_work_png", "nav_work.png");
            session.setAttribute("action_msg_png", "nav_msg.png");
            session.setAttribute("action_my_png", "nav_my_focus.png");
            return;
        }
    }


    /******** public method *******/

    protected StringBuffer getServer(HttpServletRequest request) {
        StringBuffer sb = new StringBuffer();
        sb.append(request.getScheme()).append("://").append(request.getServerName()).append(":").append(request.getServerPort()).append(request.getContextPath());
        return sb;
    }


    protected void notifyUser() {

    }

    protected void saveMsg(UserRole role, User user, String title, String content) {
        Message message = new Message();
        message.setContent(content);
        message.setTitle(title);
        message.setTime(new Date());
        message.setState(true);
        message.setUser(user);
        List<User> users = userService.findByRole(role.getName());
        for (User u : users) {
            Message msg = message;
            msg.setUid(u.getId());
            msg.setDept(u.getDept());
            msg.setTeam(u.getTeam());
            messageService.saveMsg(msg);
        }
    }


    protected static final SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
    protected static final SimpleDateFormat dsf = new SimpleDateFormat("yyyyMMdd");

    public static final String error_page = "/error";

    @Autowired
    private MessageService messageService;

    @Autowired
    private UserService userService;

}
