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
    public String login(String username, String password) {
        User user = userService.login(username, password);
        if (user == null) {
            return webResp(APIStatus.un_check);
        }

        String role = UserRole.getRole(user.getRole()); //获取role
        //存session
        HttpSession session = request.getSession();

        store(session,response,user,role);
        /****存session,cookie end***/

        return "forward:/" + role + "/home";//跳转到相应角色页面
    }

    @RequestMapping("/query")
    public BaseDto query(String username) {
        return BaseDto.newDto(userService.findByName(username));
    }

    //    @RequestMapping(value = "/location/post",method = RequestMethod.POST)
    @RequestMapping(value = "/location/post")
    public BaseDto postLocation(String mid, Double longitude, Double latitude) {
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

    @RequestMapping("/exit")
    public String queryLocation() {
        HttpSession session = request.getSession();
        if (session != null) {
            session.invalidate();
        }
        return "/index";
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
