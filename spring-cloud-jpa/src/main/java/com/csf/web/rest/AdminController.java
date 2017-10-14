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
        onclick(true, false, false, false);
        return "/admin/home";
    }

    @RequestMapping("/work")
    public String work() {
        onclick(false, true, false, false);
        return "/admin/work";
    }

    @RequestMapping("/message")
    public String message() {
        onclick(false, false, true, false);
        return "/admin/message";
    }

    @RequestMapping("/my")
    public String my() {
        onclick(false, false, false, true);
        return "/admin/my";
    }


}
