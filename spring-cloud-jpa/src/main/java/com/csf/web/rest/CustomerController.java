package com.csf.web.rest;

import com.csf.web.constants.OAConstants;
import com.csf.web.dto.BaseDto;
import com.csf.web.entity.Advice;
import com.csf.web.entity.User;
import com.csf.web.service.AdviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * Created by changqi.wu on 17-10-2.
 */
@Controller
@RequestMapping("/customer")
public class CustomerController extends APIService {

    @Autowired
    private AdviceService adviceService;

    @RequestMapping("/home")
    public String home() {
        return "/customer/home";
    }

    @RequestMapping("/work")
    public String work() {
        return "/customer/work";
    }

    @RequestMapping("/message")
    public String message() {
        return "/customer/message";
    }

    @RequestMapping("/my")
    public String my() {
        return "/customer/my";
    }


    @RequestMapping("/advice")
    @ResponseBody
    public BaseDto advice(String advice) {
        Advice adv = new Advice();
        adv.setContent(advice);
        adv.setState(true);
        adv.setTime(new Date());
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        adv.setUser(user);
        adv = adviceService.addAdvice(adv);
        return BaseDto.newDto(adv);
    }


}
