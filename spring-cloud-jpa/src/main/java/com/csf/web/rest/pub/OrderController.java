package com.csf.web.rest.pub;

import com.csf.web.constants.OAConstants;
import com.csf.web.dto.BaseDto;
import com.csf.web.entity.Device;
import com.csf.web.entity.Order;
import com.csf.web.entity.User;
import com.csf.web.rest.APIService;
import com.csf.web.service.DeviceService;
import com.csf.web.service.OrderService;
import com.csf.web.util.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * Created by changqi.wu on 17-10-12.
 */
@Controller
@RequestMapping("/web/order")
public class OrderController extends APIService {

    @Autowired
    private OrderService orderService;
    @Autowired
    private DeviceService deviceService;

    @ResponseBody
    @RequestMapping("/user/message")
    public BaseDto getUserOrderMsg() {

        return BaseDto.newDto(null);
    }

    @RequestMapping("/message/{id}")
    public String getUserOrderMsgDetail(@PathVariable("id") Long id) {

        return "";
    }

    @ResponseBody
    @RequestMapping("/add")
    public BaseDto add(Order order) {
        System.out.println(JsonUtils.toJson(order));
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        order.setPid(user.getId());
        order.setState("1");
        order.setTime(new Date());
        Device device = deviceService.findById(order.getDid());
        if (device != null) {
            order.setSn(device.getSn());
            order.setDevice(device.getName());
            order.setType(device.getType());
            order.setPrice(device.getPrice());
            order.setTotal(device.getPrice() * order.getNumber());
        }
        orderService.saveOrder(order);
        return BaseDto.newDto(order);
    }

    @ResponseBody
    @RequestMapping("/status/{status}")
    public BaseDto query(@PathVariable("status")String status,Integer page,Integer pageSize) {
        if(page == null){
            page = 0;
        }
        if(pageSize == null){
            pageSize = 30;
        }
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        if("-1".equals(status)){
            return BaseDto.newDto(orderService.queryUserAllOrder(user,page,pageSize));
        }else{

            return BaseDto.newDto(orderService.queryUserStateOrder(user,status,page,pageSize));
        }
    }



}
