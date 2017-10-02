package com.csf.web.rest.pub;

import com.csf.web.constants.OAConstants;
import com.csf.web.dto.APIStatus;
import com.csf.web.dto.BaseDto;
import com.csf.web.entity.User;
import com.csf.web.rest.APIService;
import com.csf.web.service.UserService;
import com.csf.web.util.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * Created by changqi.wu on 17-8-27.
 */
@RestController
@RequestMapping("/web/user")
public class UserActionController extends APIService{

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public BaseDto login(String username, String password) throws UnsupportedEncodingException {
        User user = userService.login(username, password);
        if(user == null){
            return ajaxResp(APIStatus.un_check);
        }
        HttpSession session = request.getSession();
        session.setAttribute(OAConstants.SESSION_USER,user);
        Cookie cookie = new Cookie(OAConstants.COOKIE_USER_NAME,username);
        cookie.setMaxAge(30*24*3600);
        response.addCookie(cookie);
        cookie = new Cookie(OAConstants.COOKIE_USER_PASSWORD,password);
        cookie.setMaxAge(30*24*3600);
        response.addCookie(cookie);
        cookie = new Cookie(OAConstants.COOKIE_USER, URLEncoder.encode(JsonUtils.toJson(user),"utf-8"));
        response.addCookie(cookie);
        cookie.setMaxAge(30*24*3600);
        response.addCookie(cookie);
        return ajaxSuccess(user);
    }

    @RequestMapping("/register")
    public BaseDto register(User user) {
        if(user == null){
            return ajaxFailure("-1","参数错误");
        }
        user = userService.findByName(user.getUsername());
        if(user != null){
            return ajaxFailure("-1","用户已存在");
        }

        userService.saveUser(user);

        HttpSession session = request.getSession();
        session.setAttribute(OAConstants.SESSION_USER,user);
        Cookie cookie = new Cookie(OAConstants.COOKIE_USER_NAME,user.getUsername());
        cookie.setMaxAge(30*24*3600);
        response.addCookie(cookie);
        cookie = new Cookie(OAConstants.COOKIE_USER_PASSWORD,user.getPassword());
        cookie.setMaxAge(30*24*3600);
        response.addCookie(cookie);
        cookie = new Cookie(OAConstants.COOKIE_USER, JsonUtils.toJson(user));
        response.addCookie(cookie);
        cookie.setMaxAge(30*24*3600);
        response.addCookie(cookie);
        return ajaxSuccess(user);
    }

}
