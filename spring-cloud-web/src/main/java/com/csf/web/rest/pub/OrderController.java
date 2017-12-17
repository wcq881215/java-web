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
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
            od.setOid(order.getId());
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

    @RequestMapping("/office/detail/{id}")
    public String getOrderDetail(@PathVariable("id") Long id) {
        Order order = orderService.findById(id);
        boolean isEdit = false;
        if (order != null) {
            if ("1".equals(order.getState())) {
                isEdit = true;
            }
            setStatus(order);
        }
        attr("data", order);
        attr("isEdit", isEdit);
        return "/order/detail_order";
    }

    @RequestMapping("/office/edit/{id}")
    public String queryOrderDetail(@PathVariable("id") Long id) {
        Order order = orderService.findById(id);
        attr("data", order);
        return "/order/editOrder";
    }

    @ResponseBody
    @RequestMapping("/delete/{id}")
    public BaseDto deleteOrder(@PathVariable("id") Long id) {
        orderService.delOrder(id);
        return BaseDto.newDto(APIStatus.success);
    }

    private void setStatus(Order order) {
        setStatus(order,null);
    }
//    private void setStatus(Order order) {
//        if ("1".equals(order.getState())) {
//            order.setState("等待发货");
//            return;
//        }
//        if ("2".equals(order.getState())) {
//            order.setState("已发货等待安装");
//            return;
//        }
//        if ("3".equals(order.getState())) {
//            order.setState("安装完成");
//            return;
//        }
//        if ("4".equals(order.getState())) {
//            order.setState("已完成");
//            return;
//        }
//    }

    private void setStatus(Order order,User user) {

        if ("1".equals(order.getState())) {
            order.setState("等待发货");
            return;
        }
        if ("2".equals(order.getState())) {
            if(CollectionUtils.isEmpty(order.getService())){
                order.setState("待派工");
                return;
            }
            if(user == null){
                order.setState("已派工");
                return;
            }
            for(OrderServer u : order.getService()){
                if(u.getUser().getId().equals(user.getId())){
                    if(u.getState().equals("0")){
                        order.setState("待接受派工");
                    }else {
                        order.setState("已发货等待安装");
                    }
                    return;
                }
            }

            order.setState("已派工");
            return;
        }
        if ("3".equals(order.getState())) {
            order.setState("安装完成");
            return;
        }
        if ("4".equals(order.getState())) {
            order.setState("已完成");
            return;
        }
    }

    @ResponseBody
    @RequestMapping("/manage/query")
    public BaseDto queryForMgr(Integer page, Integer pageSize) {
        if (page == null) {
            page = 0;
        }
        if (pageSize == null) {
            pageSize = 30;
        }
        Page<Order> datas = orderService.queryMgrOrder(page, pageSize);
        if (datas != null && !CollectionUtils.isEmpty(datas.getContent())) {
            for (Order order : datas.getContent()) {
                setStatus(order);
            }
        }
        return BaseDto.newDto(datas);
    }

    @RequestMapping("/manage/detail/{id}")
    public String getManageOrderDetail(@PathVariable("id") Long id) {
        Order order = orderService.findById(id);
        boolean isEdit = false; // 物流
        boolean isSplit = false; // 派工
        if (order != null) {
            if ("1".equals(order.getState())) {
                isEdit = true;
            }
            if ("2".equals(order.getState()) && CollectionUtils.isEmpty(order.getService())) {
                isSplit = true;
            }
            setStatus(order);
        }
        attr("data", order);
        attr("isEdit", isEdit);
        attr("isSplit", isSplit);
        return "/order/manager_order";
    }

    @RequestMapping("/manage/logistics")
    @ResponseBody
    public BaseDto addLogstic(Long id, String logistics, String iphone, String driver, String logphone, String delatime) {
        Order order = orderService.findById(id);
        if (order != null && "1".equals(order.getState())) {
            order.setLogistics(logistics);
            order.setIphone(iphone);
            order.setDriver(driver);
            order.setLogphone(logphone);
            order.setDelatime(delatime);
            order.setState("2");
            orderService.saveOrder(order);
        }
        return BaseDto.newDto(APIStatus.success);
    }

    @ResponseBody
    @RequestMapping("/manage/split")
    public BaseDto serviceSplit(Long id, String uids) {
        Order order = orderService.findById(id);
        if (order == null || !"2".equals(order.getState())) {
            return BaseDto.failure("订单无效");
        }
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        if (StringUtils.isEmpty(uids)) {
            return BaseDto.newDto(APIStatus.param_error);
        }
        for (String uid : uids.split(",")) {
            Long ud = Long.parseLong(uid);
            User u = userService.findById(ud);
            if (orderService.isExit(order, u)) {
                continue;
            }
            OrderServer orderTeah = new OrderServer();
            orderTeah.setOrder(id);
            orderTeah.setPub(user);
            orderTeah.setState("0");
            orderTeah.setTime(new Date());
            orderTeah.setUser(u);
            orderService.splitOrder(orderTeah);
        }
        return BaseDto.newDto(APIStatus.success);
    }


    @ResponseBody
    @RequestMapping("/manage/split/select")
    public BaseDto queryForManagerSplit(String status, Integer page, Integer pageSize) {
        if (page == null) {
            page = 0;
        }
        if (pageSize == null) {
            pageSize = 30;
        }
        return BaseDto.newDto(orderService.querySplitOrder(page, pageSize));
    }

    @RequestMapping("/manage/split/detail/{id}")
    public String getManageSplitOrderDetail(@PathVariable("id") Long id) {
        getManageOrderDetail(id);
        return "/order/split_order";
    }

    @ResponseBody
    @RequestMapping("/srv/select")
    public BaseDto queryForSrvSplit(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "30") Integer pageSize) {
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        return BaseDto.newDto(orderService.querySrvUserSplitOrder(user, page, pageSize));
    }

    @ResponseBody
    @RequestMapping("/srv/order")
    public BaseDto queryForSrv(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "30") Integer pageSize) {
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        Page<Order> orders = orderService.querySrvUserOrder(user, page, pageSize);
        if(orders != null && !CollectionUtils.isEmpty(orders.getContent())){
            for(Order o : orders.getContent()){
                setStatus(o,user);
            }
        }
        return BaseDto.newDto(orders);
    }

    @RequestMapping("/srv/detail/{id}")
    public String getSrvOrderSelDetail(@PathVariable("id") Long id) {
        Order order = orderService.findById(id);
        boolean isEdit = false; // 接受
        if (order != null) {
            if (!CollectionUtils.isEmpty(order.getService())) {
                User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
                for (OrderServer u : order.getService()) {
                    if (user.getId().equals(u.getUser().getId())) {
                        isEdit = true;
                    }
                }
            }
            setStatus(order);
        }
        attr("data", order);
        attr("isEdit", isEdit);
        return "/order/srv_order";
    }

    @RequestMapping("/srv/order/detail/{id}")
    public String getSrvOrderDetail(@PathVariable("id") Long id) {
        Order order = orderService.findById(id);
        String state = ""; //
        if (order != null) {
            User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
            if("2".equals(order.getState())) {
                if (!CollectionUtils.isEmpty(order.getService())) {

                    for (OrderServer u : order.getService()) {
                        if (user.getId().equals(u.getUser().getId())) {
                            state = u.getState();
                        }
                    }
                }
            }
            setStatus(order,user);
        }
        attr("data", order);
        attr("state", state);
        return "/order/srv_order_detail";
    }

    @ResponseBody
    @RequestMapping("/srv/status")
    public BaseDto updateForSrvState(Long id,String status,String reason) {
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        Order order = orderService.findById(id);
        if(order == null){
            return BaseDto.failure("订单不正确");
        }
        if(!CollectionUtils.isEmpty(order.getService())){
            for (OrderServer u : order.getService()) {
                if (user.getId().equals(u.getUser().getId())) {
                    u.setState(status);
                    u.setRemark(reason);
                    orderService.updateOrderSrvState(u);
                    return BaseDto.newDto(APIStatus.success);
                }
            }
        }
        return BaseDto.failure("订单不正确,未发现派工信息");
    }

    @ResponseBody
    @RequestMapping("/srv/sign")
    public BaseDto updateForSrvState(Long id,String type,String  longitude,String  latitude) {
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        Order order = orderService.findById(id);
        if(order == null){
            return BaseDto.failure("订单不正确,未发现派工信息");
        }

        if(StringUtils.isEmpty(longitude)){
            longitude = "";
        }

        if(StringUtils.isEmpty(latitude)){
            latitude = "";
        }
        String address = "浙江省临海市江南街道汇丰南路328号";
        Sign sign = new Sign();
        sign.setOrder(order);
        sign.setAddress(address);
        sign.setUser(user);
        sign.setType(type);
        sign.setTime(new Date());
        orderService.addSign(sign);

        return BaseDto.newDto(APIStatus.success);
    }


}
