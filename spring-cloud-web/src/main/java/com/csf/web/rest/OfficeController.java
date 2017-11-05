package com.csf.web.rest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by changqi.wu on 17-10-2.
 */
@Controller
@RequestMapping("/office")
public class OfficeController extends APIService {

    @RequestMapping("/home")
    public String home() {
        onclick(true, false, false, false);
        return "/office/home";
    }

    @RequestMapping("/work")
    public String work() {
        onclick(false, true, false, false);
        return "/office/work";
    }

    @RequestMapping("/message")
    public String message() {
        onclick(false, false, true, false);
        return "/office/message";
    }

    @RequestMapping("/my")
    public String my() {
        onclick(false, false, false, true);
        return "/office/my";
    }


}
