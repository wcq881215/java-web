package com.jinxi.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by changqi.wu on 2017/7/24.
 */
@Controller
public class IndexController {

    @Autowired
    private HttpServletRequest request;

    @RequestMapping("/index")
    public ModelAndView b() {
        ModelAndView view = new ModelAndView();
        view.setViewName("regiester");
        request.setAttribute("msg", "Davie");
        return view;
    }


}
