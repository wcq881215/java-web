package com.csf.web.rest.pub;

import com.csf.web.dto.APIStatus;
import com.csf.web.dto.BaseDto;
import com.csf.web.entity.User;
import com.csf.web.entity.UserRole;
import com.csf.web.rest.APIService;
import com.csf.web.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by changqi.wu on 17-8-27.
 */
@RestController
@RequestMapping("/web/user")
public class UserActionController extends APIService {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public BaseDto login(String username, String password) throws UnsupportedEncodingException {
        User user = userService.login(username, password);
        if (user == null) {
            return ajaxResp(APIStatus.un_check);
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
        user = userService.findByName(user.getUsername());
        if (user != null) {
            return ajaxFailure("-1", "用户已存在");
        }
        userService.saveUser(user);

        store(request.getSession(), response, user, UserRole.CUSTOMER.getRole());
        return ajaxSuccess(user);
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
