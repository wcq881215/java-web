package com.csf.web.rest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by changqi.wu on 17-10-2.
 */
@Controller
@RequestMapping("/admin")
public class AdminController extends APIService {

    @RequestMapping("/home")
    public String home() {
        return "/admin/home";
    }

    @RequestMapping("/work")
    public String work() {
        return "/admin/work";
    }

    @RequestMapping("/message")
    public String message() {
        return "/admin/message";
    }

    @RequestMapping("/my")
    public String my() {
        return "/admin/my";
    }


}
