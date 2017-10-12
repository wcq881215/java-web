package com.csf.web.rest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by changqi.wu on 17-10-2.
 */
@Controller
@RequestMapping("/office")
public class OfficeController extends APIService{

    @RequestMapping("/home")
    public String home() {
        return "/office/home";
    }

    @RequestMapping("/work")
    public String work() {
        return "/office/work";
    }

    @RequestMapping("/message")
    public String message() {
        return "/office/message";
    }

    @RequestMapping("/my")
    public String my() {
        return "/office/my";
    }


}
