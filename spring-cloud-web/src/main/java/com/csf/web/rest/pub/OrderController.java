package com.csf.web.rest.pub;

import com.csf.web.constants.OAConstants;
import com.csf.web.dto.APIStatus;
import com.csf.web.dto.BaseDto;
import com.csf.web.entity.*;
import com.csf.web.rest.APIService;
import com.csf.web.service.DeviceService;
import com.csf.web.service.OrderService;
import com.csf.web.service.UserService;
import com.csf.web.util.JsonUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
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
    private static final Logger logger = Logger.getLogger(OrderController.class);

    @Autowired
    private OrderService orderService;
    @Autowired
    private DeviceService deviceService;
    @Autowired
    private UserService userService;

    @ResponseBody
    @RequestMapping("/add")
    public BaseDto add(Order order, String dids, String numbs, String weights) { //weight暂部处理
        if (order == null || StringUtils.isEmpty(dids) || StringUtils.isEmpty(numbs)) {
            return BaseDto.newDto(APIStatus.param_error);
        }
        System.out.println(JsonUtils.toJson(order));
        System.out.println(dids);
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        order.setState("1");
        order.setTime(new Date());
        order.setPub(user);
        order = orderService.saveOrder(order);

        String[] did = dids.split(",");
        String[] nums = numbs.split(",");
        for (int i = 0; i < did.length; i++) {
            String d = did[i];
            String nu = nums[i];
            Long di = Long.valueOf(d);
            Integer no = Integer.valueOf(nu);
            Device device = deviceService.findById(di);
            OrderDevice od = new OrderDevice();
            od.setDevice(device);
            od.setNumb(no);
//            od.setOid(order.getId());
            orderService.saveOrderDevice(od);
        }
        saveMsg(UserRole.MANAGER, user, "有新订单待发货", "订单编号" + order.getId() + ",请在我的工单里面查收");
        return BaseDto.newDto(order);
    }

    @ResponseBody
    @RequestMapping("/status/{status}")
    public BaseDto query(@PathVariable("status") String status, Integer page, Integer pageSize) {
        if (page == null) {
            page = 0;
        }
        if (pageSize == null) {
            pageSize = 30;
        }
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        Page<Order> datas = null;
        if ("-1".equals(status)) {
            datas = orderService.queryUserAllOrder(user, page, pageSize);
        } else {
            datas = orderService.queryUserStateOrder(user, status, page, pageSize);
        }
        if (datas != null && !CollectionUtils.isEmpty(datas.getContent())) {
            for (Order order : datas.getContent()) {
                setStatus(order);
            }
        }

        return BaseDto.newDto(datas);
    }

    private void setStatus(Order order) {
        if ("1".equals(order.getState()) ) {
            order.setState("等待发货");
            return;
        }
        if ("2".equals(order.getState()) ) {
            order.setState("已发货等待安装");
            return;
        }
        if ("3".equals(order.getState()) ) {
            order.setState("安装完成");
            return;
        }
        if ("4".equals(order.getState())) {
            order.setState("已完成");
            return;
        }
    }

    @ResponseBody
    @RequestMapping("/srv/select")
    public BaseDto queryForSrv(Integer page, Integer pageSize) {
        if (page == null) {
            page = 0;
        }
        if (pageSize == null) {
            pageSize = 30;
        }
        return BaseDto.newDto(orderService.querySrvOrder(page, pageSize));
    }



}
