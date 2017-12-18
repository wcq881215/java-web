package com.csf.web.rest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by changqi.wu on 17-10-2.
 */
@Controller
@RequestMapping("/technician")
public class TechnicianController extends APIService {

    @RequestMapping("/home")
    public String home() {
        onclick(true, false, false, false);
        return "/technician/home";
    }

    @RequestMapping("/work")
    public String work() {
        onclick(false, true, false, false);
        return "/technician/work";
    }

    @RequestMapping("/message")
    public String message() {
        onclick(false, false, true, false);
        return "/technician/message";
    }

    @RequestMapping("/my")
    public String my() {
        onclick(false, false, false, true);
        return "/technician/my";
    }


}
