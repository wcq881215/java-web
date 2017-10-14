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

        onclick(true, false, false, false);
        return "/aftersales/home";
    }

    @RequestMapping("/work")
    public String work() {
        onclick(false, true, false, false);
        return "/aftersales/work";
    }

    @RequestMapping("/message")
    public String message() {
        onclick(false, false, true, false);
        return "/aftersales/message";
    }

    @RequestMapping("/my")
    public String my() {
        onclick(false, false, false, true);
        return "/aftersales/my";
    }
}
