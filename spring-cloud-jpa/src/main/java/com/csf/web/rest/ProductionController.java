package com.csf.web.rest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by changqi.wu on 17-10-2.
 */
@Controller
@RequestMapping("/production")
public class ProductionController extends APIService{

    @RequestMapping("/home")
    public String home(){
        return "";
    }


}
