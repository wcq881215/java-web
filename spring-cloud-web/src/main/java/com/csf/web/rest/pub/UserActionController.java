package com.csf.web.rest.pub;

import com.csf.web.constants.OAConstants;
import com.csf.web.dto.APIStatus;
import com.csf.web.dto.BaseDto;
import com.csf.web.entity.Device;
import com.csf.web.entity.User;
import com.csf.web.entity.UserRole;
import com.csf.web.rest.APIService;
import com.csf.web.rest.UserController;
import com.csf.web.service.DeviceService;
import com.csf.web.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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

    @Autowired
    private DeviceService deviceService;

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

        if ("购机客户".equals(user.getRole())) {
            String device = user.getDevice();
            Boolean right = deviceService.existDevice(device);
            session.setAttribute("cust_right",right);
        }

        /****存cookie end***/

        return ajaxSuccess(user);
    }

    @RequestMapping("/message")
    public BaseDto register() {
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        long total = userService.getMessageNo(user);
        return BaseDto.newDto(total);
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

        if ("购机客户".equals(user.getRole())) {
            String device = user.getDevice();
            Boolean right = deviceService.existDevice(device);
            request.getSession().setAttribute("cust_right",right);
        }

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
        if ("购机客户".equals(user.getRole())) {
            String device = user.getDevice();
            Boolean right = deviceService.existDevice(device);
            request.getSession().setAttribute("cust_right",right);
        }
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
    public BaseDto listInnerUser(String key,String type,@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "30") Integer pageSize) {
        return BaseDto.newDto(userService.findAllInner(key,type,page, pageSize));
    }

    @RequestMapping("/list/server")
    public BaseDto listServerUser(String key,@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "30") Integer pageSize) {
        return BaseDto.newDto(userService.findAllInner(key,page, pageSize));
    }

    @RequestMapping("/delete")
    public BaseDto delete(Long id) {
        if(id == null){
            return BaseDto.newDto(APIStatus.param_error);
        }
        userService.delete(id);
        return BaseDto.newDto(APIStatus.success);
    }

    @RequestMapping("/cust/list")
    public BaseDto delete(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "30") Integer pageSize) {
        Page<User> data = userService.findAllInner("", "购机客户", page, pageSize);
        return BaseDto.newDto(data);
    }

    @RequestMapping("/detail/{id}")
    public ModelAndView getUserDetail(@PathVariable("id") Long id,ModelAndView v) {
        User data = userService.findById(id);
        v.addObject("data",data);
         v.setViewName("/user/detail");
         return v;
    }

}
