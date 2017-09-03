package com.csf.web.rest;

import com.csf.web.entity.SysConfig;
import com.csf.web.entity.User;
import com.csf.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by changqi.wu on 2017/8/8.
 */
@RestController
@RequestMapping("/user")
public class UserController extends  APIService{

    @Autowired
    private UserService userService;

    @RequestMapping("/list")
    public List<User> list() {
        return userService.findAll();
    }

    @RequestMapping("/login")
    public User login(String username,String password) {
        return userService.login(username,password);
    }

    @RequestMapping("/query")
    public User query(String username) {
        return userService.findByName(username);
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
