package com.csf.web.rest.pub;

import com.csf.web.dto.APIStatus;
import com.csf.web.dto.BaseDto;
import com.csf.web.entity.User;
import com.csf.web.entity.UserRole;
import com.csf.web.rest.APIService;
import com.csf.web.rest.UserController;
import com.csf.web.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * Created by changqi.wu on 17-8-27.
 */
@RestController
@RequestMapping("/web/user")
public class UserActionController extends APIService {
    private static final Logger logger = Logger.getLogger(UserActionController.class);

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public BaseDto login(String username, String password,String mid) throws UnsupportedEncodingException {
        User user = userService.login(username, password);
        if (user == null) {
            return ajaxResp(APIStatus.un_check);
        }

        if (StringUtils.isNotBlank(mid)) {
            logger.info("login with idfa >>> " + mid);
            user.setMobno(mid);
            userService.saveUser(user);
        }

        String role = UserRole.getRole(user.getRole()); //获取role
        HttpSession session = request.getSession();

        store(session, response, user, role);

        /****存cookie end***/

        return ajaxSuccess(user);
    }

    @RequestMapping("/register")
    public BaseDto register(User user) {
        if (user == null) {
            return ajaxFailure("-1", "参数错误");
        }
        User u = userService.findByName(user.getUsername());
        if (u != null) {
            return ajaxFailure("-1", "用户已存在");
        }
        user.setState(true);
        user.setS_time(new Date());
        userService.saveUser(user);

        store(request.getSession(), response, user, UserRole.CUSTOMER.getRole());
        return ajaxSuccess(user);
    }

    @RequestMapping("/add")
    public BaseDto addUser(User user) {
        if(user == null){
            return BaseDto.newDto(APIStatus.param_error);
        }
        user.setRole(user.getDept());
        user.setS_time(new Date());
        user.setState(true);
        user = userService.saveUser(user);
        return BaseDto.newDto(user);
    }

    @RequestMapping("/update")
    public BaseDto update(Long id, String name, String password, String phone) {
        if (id == null) {
            return ajaxFailure("-1", "参数错误");
        }
        User user = userService.findById(id);
        if (user == null) {
            return ajaxFailure("-1", "用户不存在");
        }

        if (StringUtils.isNotBlank(name)) {
            user.setName(name);
        }
        if (StringUtils.isNotBlank(password)) {
            user.setPassword(password);
        }
        if (StringUtils.isNotBlank(phone)) {
            user.setPhone(phone);
        }

        userService.saveUser(user);

        String role = UserRole.getRole(user.getRole()); //获取role

        store(request.getSession(), response, user, role);

        return ajaxSuccess(user);
    }


    @RequestMapping("/check")
    public Boolean checkUsername(String username) {
        if(username == null){
            return false;
        }
        User user = userService.findByName(username);
        if(user == null){
            return true;
        }
        return false;
    }


    @RequestMapping("/type/list")
    public BaseDto listType() {
        UserRole[] roles = UserRole.values();
        Map<String, String> rs = new HashMap<>();
        for (UserRole role : roles) {
            rs.put(role.getRole(), role.getName());
        }
        return BaseDto.newDto(rs);
    }

    @RequestMapping("/list")
    public BaseDto listUser(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "30") Integer pageSize) {
        return BaseDto.newDto(userService.findAll(page, pageSize));
    }

    @RequestMapping("/list/inner")
    public BaseDto listInnerUser(String key,@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "30") Integer pageSize) {
        return BaseDto.newDto(userService.findAllInner(key,page, pageSize));
    }

}
