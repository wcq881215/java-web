package com.csf.web.rest;

import com.csf.web.constants.OAConstants;
import com.csf.web.dto.BaseDto;
import com.csf.web.entity.Advice;
import com.csf.web.entity.Order;
import com.csf.web.entity.PurchaseDevice;
import com.csf.web.entity.User;
import com.csf.web.service.AdviceService;
import com.csf.web.service.OrderService;
import com.csf.web.service.PurchaseDeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    private PurchaseDeviceService purchaseDeviceService;

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
    public BaseDto addDevice(String name, String type, String remark, Integer number) {
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);

        PurchaseDevice device = new PurchaseDevice();
        device.setState(1);
        device.setRemark(remark);
        device.setName(name);
        device.setNumber(number);
        device.setTime(new Date());
        device.setType(type);
        device.setPub(user);
        device = purchaseDeviceService.save(device);

        return BaseDto.newDto(device);
    }

    @RequestMapping("/purchar/detail/{id}")
    public String query(@PathVariable("id") Long  id) {

        PurchaseDevice  device = purchaseDeviceService.findById(id);
        attr("data",device);
        return "/order/purchase_detail";
    }



    @RequestMapping("/purchar/list")
    @ResponseBody
    public BaseDto purcharList(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "10") Integer pageSize) {
        return BaseDto.newDto(purchaseDeviceService.findAll(page, pageSize));
    }

    @RequestMapping("/advice/list")
    @ResponseBody
    public BaseDto adviceList() {
        return BaseDto.newDto(adviceService.findAll());
    }


}
