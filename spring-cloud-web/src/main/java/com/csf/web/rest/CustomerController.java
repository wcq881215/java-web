package com.csf.web.rest;

import com.csf.web.constants.OAConstants;
import com.csf.web.dto.BaseDto;
import com.csf.web.entity.Advice;
import com.csf.web.entity.Order;
import com.csf.web.entity.User;
import com.csf.web.service.AdviceService;
import com.csf.web.service.OrderService;
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

    @Autowired
    private OrderService orderService;

    @RequestMapping("/home")
    public String home() {
        onclick(true, false, false, false);
        return "/customer/home";
    }

    @RequestMapping("/work")
    public String work() {
        onclick(false, true, false, false);
        return "/customer/work";
    }

    @RequestMapping("/message")
    public String message() {
        onclick(false, false, true, false);
        return "/customer/message";
    }

    @RequestMapping("/my")
    public String my() {
        onclick(false, false, false, true);
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

    @RequestMapping("/purchar/device")
    @ResponseBody
    public BaseDto addDevice(String name, String type, String remark) {
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        return BaseDto.newDto("no service");
    }

    @RequestMapping("/advice/list")
    @ResponseBody
    public BaseDto adviceList() {
        return BaseDto.newDto(adviceService.findAll());
    }


}
