package com.csf.web.rest;

import com.csf.web.constants.OAConstants;
import com.csf.web.dto.APIStatus;
import com.csf.web.dto.BaseDto;
import com.csf.web.entity.Location;
import com.csf.web.entity.SysConfig;
import com.csf.web.entity.User;
import com.csf.web.entity.UserRole;
import com.csf.web.service.LocationService;
import com.csf.web.service.UserService;
import com.csf.web.util.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

/**
 * Created by changqi.wu on 2017/8/8.
 */
@Controller
@RequestMapping("/user")
public class UserController extends APIService {

    @Autowired
    private UserService userService;

    @Autowired
    private LocationService locationService;

    @RequestMapping("/login")
    public String  login(String username, String password) {
        User user = userService.login(username, password);
        if(user == null){
            return webResp(APIStatus.un_check);
        }
        //存session
        HttpSession session = request.getSession();
        session.setAttribute(OAConstants.SESSION_USER,user);
        /***存cookie**/
        Cookie cookie = new Cookie(OAConstants.COOKIE_USER_NAME,username);
        cookie.setMaxAge(30*24*3600);
        response.addCookie(cookie);
        cookie = new Cookie(OAConstants.COOKIE_USER_PASSWORD,password);
        cookie.setMaxAge(30*24*3600);
        response.addCookie(cookie);
        cookie = new Cookie(OAConstants.COOKIE_USER_TYPE,user.getRole());
        cookie.setMaxAge(30*24*3600);
        response.addCookie(cookie);
        try {
            cookie = new Cookie(OAConstants.COOKIE_USER, URLEncoder.encode(JsonUtils.toJson(user),"utf-8"));
            response.addCookie(cookie);
            cookie.setMaxAge(30*24*3600);
            response.addCookie(cookie);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        /****存cookie end***/
        String role = UserRole.getRole(user.getRole()); //跳转到相应角色页面
        session.setAttribute("role",role);
        return "forward:/"+role+"/home";
    }

    @RequestMapping("/query")
    public BaseDto query(String username) {
        return BaseDto.newDto(userService.findByName(username));
    }

//    @RequestMapping(value = "/location/post",method = RequestMethod.POST)
    @RequestMapping(value = "/location/post")
    public BaseDto postLocation(String mid,Double longitude,Double latitude) {
        Location location = new Location();
        location.setLatitude(latitude);
        location.setLongitude(longitude);
        location.setMid(mid);
        locationService.saveUserLocation(location);
        return BaseDto.newDto(APIStatus.success);
    }

    @RequestMapping("/location/query")
    public BaseDto queryLocation(String mid) {
        User u = new User();
        u.setMobno(mid);
        return BaseDto.newDto(locationService.getUserLocation(u));
    }

//    @RequestMapping("/save")
//    public String save() {
//        SysConfig conf = new SysConfig();
//        conf.setName("test");
//        conf.set_key("cfg_key");
//        conf.setComment("test");
//        conf.setState(true);
//        conf.setValue("-- val --");
//        userService.saveUser(conf);
//        System.out.println("================success============");
//        return "success";
//    }

}
