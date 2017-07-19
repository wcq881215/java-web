package com.jinxi.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by changqi.wu on 17-7-19.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @RequestMapping("/login")
    @ResponseBody
    public String login(String username,String password){
        System.out.println("user name "+username + " passwd "+ password);
        return "success";
    }

    @RequestMapping("/index")
    public String test(){
        System.out.println("user index ");
        return "/success";
    }
}
