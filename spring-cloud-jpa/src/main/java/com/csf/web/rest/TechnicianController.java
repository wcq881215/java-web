package com.csf.web.rest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by changqi.wu on 17-10-2.
 */
@Controller
@RequestMapping("/technician")
public class TechnicianController extends APIService{

    @RequestMapping("/home")
    public String home() {
        return "/technician/home";
    }

    @RequestMapping("/work")
    public String work() {
        return "/technician/work";
    }

    @RequestMapping("/message")
    public String message() {
        return "/technician/message";
    }

    @RequestMapping("/my")
    public String my() {
        return "/technician/my";
    }




}
