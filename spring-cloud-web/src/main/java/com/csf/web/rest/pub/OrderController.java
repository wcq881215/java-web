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
import com.google.common.collect.Lists;
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
import java.util.List;

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
    public BaseDto add(Order order, String dids, String numbs, String weights) {
        if (order == null || StringUtils.isEmpty(dids) || StringUtils.isEmpty(numbs)) {
            return BaseDto.newDto(APIStatus.param_error);
        }
        System.out.println(JsonUtils.toJson(order));
        System.out.println(dids);
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        order.setState("1");
        order.setTime(new Date());

        String[] did = dids.split(",");
        String[] nums = numbs.split(",");
        List<OrderDevice> ors = Lists.newArrayList();
        for (int i = 0; i < did.length; i++) {
            String d = did[i];
            String nu = nums[i];
            Long di = Long.valueOf(d);
            Double wg = Double.valueOf(nu);
            Device device = deviceService.findById(di);
            OrderDevice od = new OrderDevice();
            od.setDevice(device);
            od.setWeight(wg);
//            od.setWeight();
            ors.add(od);
        }
        order.setDevices(ors);
        order = orderService.saveOrder(order);

        saveMsg(UserRole.MANAGER, user, "有新订单待发货", "订单编号" + order.getId() + ",请在我的工单里面查收");
        return BaseDto.newDto(order);
    }


}
