package com.csf.web.rest.pub;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by changqi.wu on 17-9-3.
 */
@Controller
public class IndexController {


    @RequestMapping(path ={"/","/index","/home"})
    public String index(){

        return "index";
    }

    @RequestMapping(path ={"/admin","/root","/admin/login"})
    public String admin(){

        return "index";
    }

}
