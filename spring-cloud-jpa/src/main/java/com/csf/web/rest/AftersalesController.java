package com.csf.web.rest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by changqi.wu on 17-10-2.
 */
@Controller
@RequestMapping("/aftersales")
public class AftersalesController extends APIService {

    @RequestMapping("/home")
    public String home() {
        return "/aftersales/home";
    }

    @RequestMapping("/work")
    public String work() {
        return "/aftersales/work";
    }

    @RequestMapping("/message")
    public String message() {
        return "/aftersales/message";
    }

    @RequestMapping("/my")
    public String my() {
        return "/aftersales/my";
    }
}
