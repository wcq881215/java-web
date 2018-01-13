package com.csf.web.rest.pub;

import com.csf.web.constants.OAConstants;
import com.csf.web.dto.APIStatus;
import com.csf.web.dto.BaseDto;
import com.csf.web.entity.*;
import com.csf.web.location.LocationRequest;
import com.csf.web.rest.APIService;
import com.csf.web.service.DeviceService;
import com.csf.web.service.LocationService;
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

import javax.servlet.http.HttpSession;
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
    public BaseDto add(Order order, String dids, String numbs, String weights) { //weight暂部处理
        if (order == null || StringUtils.isEmpty(dids) || StringUtils.isEmpty(numbs)) {
            return BaseDto.newDto(APIStatus.param_error);
        }
        logger.info("add order ==>" + JsonUtils.toJson(order));
        logger.info("add order device ==>" + dids);
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
        saveMsg(UserRole.OFFICE, user, user, "有新订单待发货", "订单编号" + order.getId() + ",请在我的工单里面查收");
        return BaseDto.newDto(order);
    }

    // 维修订单
    @ResponseBody
    @RequestMapping("/fix/add")
    public BaseDto addFixOrder(FixOrder order, String dids) {
        if (order == null || StringUtils.isBlank(dids)) {
            return BaseDto.newDto(APIStatus.param_error);
        }
        logger.info("add order ==>" + JsonUtils.toJson(order));
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        order.setState("1");
        order.setTime(new Date());
        order.setPub(user);
        order = orderService.saveFixOrder(order);

        String[] dis = dids.split(",");
        for (String di : dis) {
            Long uid = Long.valueOf(di);
            User server = userService.findById(uid);
            FixOrderServer fxs = new FixOrderServer();
            fxs.setTime(new Date());
            fxs.setOrder(order.getId());
            fxs.setPub(user);
            fxs.setState("0");
            fxs.setUser(server);
            orderService.saveFixOrderServer(fxs);
            saveMsg(UserRole.SERVICE, server, user, "有新维修订单待处理", "订单编号" + order.getId() + ",请在我的工单里面查收");
        }
        return BaseDto.newDto(order);
    }

    @ResponseBody
    @RequestMapping("/update")
    public BaseDto editOrder(Order order, String dids, String numbs, String weights) {
        if (order == null || order.getId() == null || StringUtils.isEmpty(dids) || StringUtils.isEmpty(numbs)) {
            return BaseDto.newDto(APIStatus.param_error);
        }
        logger.info("new order is ==> " + JsonUtils.toJson(order));
        logger.info("new devices is --> " + dids);

        Order o = orderService.findById(order.getId());
        if (o != null) {
            orderService.delOrderDevice(order.getId());
        }

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
        saveMsg(UserRole.OFFICE, user, user, "有新订单待发货", "订单编号" + order.getId() + ",请在我的工单里面查收");
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
        setStatus(order, null);
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

    private void setStatus(Order order, User user) {

        List<OrderDevice> devices = order.getDevices();
        if (!CollectionUtils.isEmpty(devices)) {
            for (OrderDevice dev : devices) {
                String dname = dev.getDevice().getName();
                if (dname.length() > 20) {
                    dev.getDevice().setName(dname.substring(0, 20)); // 取20位长度
                }
            }
        }

        if ("1".equals(order.getState())) {
            order.setState("等待发货");
            order.setColor("#b9d5f3;");
            return;
        }
        if ("2".equals(order.getState())) {
            if (CollectionUtils.isEmpty(order.getService())) {
                order.setState("待派工");
                order.setColor("#f3b9b9");
                return;
            }
            if (user == null) {
                order.setState("已派工");
                order.setColor("#b9f3d6;");
                return;
            }
            for (OrderServer u : order.getService()) {
                if (u.getUser().getId().equals(user.getId())) {
                    if (u.getState().equals("0")) {
                        order.setState("待接受派工");
                        order.setColor("#e7f3b9;");
                    } else {
                        order.setState("已发货等待安装");
                        order.setColor("#e8cec3;");
                    }
                    return;
                }
            }
            order.setColor("#b9f3d6;");
            order.setState("已派工");
            return;
        }
        if ("3".equals(order.getState())) {
            order.setState("安装完成");
            order.setColor("#c9b1de");
            return;
        }
        if ("4".equals(order.getState())) {
            order.setColor("#c0cec8;");
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
            User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
            saveMsg(UserRole.MANAGER, user, "有新订单待派工", "订单编号" + order.getId() + ",请在我的工单里面查收");
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
        Page<Order> orders = orderService.querySplitOrder(page, pageSize);
        if (orders != null && !CollectionUtils.isEmpty(orders.getContent())) {
            for (Order o : orders.getContent()) {
                setStatus(o, null);
            }
        }
        return BaseDto.newDto(orders);
    }

    @RequestMapping("/manage/split/detail/{id}")
    public String getManageSplitOrderDetail(@PathVariable("id") Long id) {
        getManageOrderDetail(id);
        return "/order/split_order";
    }

    /**
     * 查询安装订单
     *
     * @param page
     * @param pageSize
     * @return
     */
    @ResponseBody
    @RequestMapping("/srv/select")
    public BaseDto queryForSrvSplit(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "30") Integer pageSize) {
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        Page<Order> obj = orderService.querySrvUserSplitOrder(user, page, pageSize);
        return BaseDto.newDto(obj);
    }

    /**
     * 查询维修订单
     *
     * @param page
     * @param pageSize
     * @return
     */
    @ResponseBody
    @RequestMapping("/srv/fix/select")
    public BaseDto queryForSrvFixSplit(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "30") Integer pageSize) {
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        Page<FixOrder> data = orderService.querySrvUserFixOrder(user, page, pageSize);
        if (!CollectionUtils.isEmpty(data.getContent())) {
            for (FixOrder order : data.getContent()) {
                setFixStatus(order,user);
                String ext = order.getExt();
                if(StringUtils.isNotBlank(ext) && ext.length() > 10){
                    order.setExt(ext.substring(0, 10));
                }
            }
        }
        return BaseDto.newDto(data);
    }

    @ResponseBody
    @RequestMapping("/srv/order")
    public BaseDto queryForSrv(@RequestParam(defaultValue = "0") Integer
                                       page, @RequestParam(defaultValue = "30") Integer pageSize) {
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        Page<Order> orders = orderService.querySrvUserOrder(user, page, pageSize);
        if (orders != null && !CollectionUtils.isEmpty(orders.getContent())) {
            for (Order o : orders.getContent()) {
                setStatus(o, user);
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

    @RequestMapping("/srv/detail/fix/{id}")
    public String getSrvOrderSelFixDetail(@PathVariable("id") Long id) {
        FixOrder order = orderService.findFixOrder(id);
        boolean isEdit = false; // 接受
        if (order != null) {
            if (!CollectionUtils.isEmpty(order.getFixOrderServer())) {
                User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
                setFixStatus(order,user);
                for (FixOrderServer u : order.getFixOrderServer()) {
                    if (user.getId().equals(u.getUser().getId())) {
                        isEdit = true;
                    }
                }
            }
        }
        attr("data", order);
        attr("isEdit", isEdit);
        return "/order/srv_fix_order";
    }

    @RequestMapping("/srv/order/detail/{id}")
    public String getSrvOrderDetail(@PathVariable("id") Long id) {
        Order order = orderService.findById(id);
        String state = "-1"; //
        boolean issign = false; //是否sign
        if (order != null) {
            User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
            if ("2".equals(order.getState())) {
                if (!CollectionUtils.isEmpty(order.getService())) {

                    for (OrderServer u : order.getService()) {
                        if (user.getId().equals(u.getUser().getId())) {
                            state = u.getState();
                        }
                    }
                }
                if (orderService.sign(user, order)) {
                    issign = true;
                }
            }
            setStatus(order, user);
        }
        attr("data", order);
        attr("state", state);
        attr("issign", issign);
        return "/order/srv_order_detail";
    }

    /**
     * 同意/拒绝派工  -- 安装派工
     *
     * @param id
     * @param status
     * @param reason
     * @return
     */
    @ResponseBody
    @RequestMapping("/srv/status")
    public BaseDto updateForSrvState(Long id, String status, String reason) {
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        Order order = orderService.findById(id);
        if (order == null) {
            return BaseDto.failure("订单不正确");
        }
        if (!CollectionUtils.isEmpty(order.getService())) {
            boolean isAllFinish = true;
            User pub = null;
            for (OrderServer u : order.getService()) {
                if (user.getId().equals(u.getUser().getId())) {
                    pub = u.getPub();
                    u.setState(status);
                    u.setRemark(reason);
                    orderService.updateOrderSrvState(u);
                }
                if (!"2".equals(u.getState())) {
                    isAllFinish = false;
                }
            }
            if (isAllFinish) {
                order.setState("3");//全部服务人员完成
                orderService.saveOrder(order);
            }
            //1处理中 2处理完毕 -1 已拒绝',
            String title = null, content = null;
            if ("1".equals(status)) {
                title = "安装订单派工已接受";
                content = "订单编号" + order.getId() + " 服务人员：" + user.getName() + ",请在我的工单里面查收";
            } else if ("2".equals(status)) {
                title = "安装订单派工已处理完毕";
                content = "订单编号" + order.getId() + " 服务人员：" + user.getName() + ",请在我的工单里面查收";
            } else {
                title = "安装订单派工已拒绝";
                content = "订单编号" + order.getId() + " 服务人员：" + user.getName() + " \t 原因: " + reason;
            }

            saveMsg(UserRole.MANAGER, pub, user, title, content);
            return BaseDto.newDto(APIStatus.success);
        }
        return BaseDto.failure("订单不正确,未发现派工信息");
    }

    /**
     * 同意/拒绝派工  -- 维修派工
     *
     * @param id
     * @param status
     * @param reason
     * @return
     */
    @ResponseBody
    @RequestMapping("/srv/fix/status")
    public BaseDto updateForSrvFixState(Long id, String status, String reason) {
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        FixOrder order = orderService.findFixOrder(id);
        if (order == null) {
            return BaseDto.failure("订单不正确");
        }
        if (!CollectionUtils.isEmpty(order.getFixOrderServer())) {
            boolean isAllFinish = true;
            User pub = null;
            for (FixOrderServer u : order.getFixOrderServer()) {
                if (user.getId().equals(u.getUser().getId())) {
                    pub = u.getPub();
                    u.setState(status);
                    u.setRemark(reason);
                    orderService.saveFixOrderServer(u);
                }
                if (!"2".equals(u.getState())) {
                    isAllFinish = false;
                }
            }
            if (isAllFinish) {
                order.setState("2");//全部服务人员完成
                orderService.saveFixOrder(order);
            }
            //1处理中 2处理完毕 -1 已拒绝',
            String title = null, content = null;
            if ("1".equals(status)) {
                title = "维修订单派工已接受";
                content = "订单编号" + order.getId() + " 服务人员：" + user.getName() + ",请在我的工单里面查收";
            } else if ("2".equals(status)) {
                title = "维修订单派工已处理完毕";
                content = "订单编号" + order.getId() + " 服务人员：" + user.getName() + ",请在我的工单里面查收";
            } else {
                title = "维修订单派工已拒绝";
                content = "订单编号" + order.getId() + " 服务人员：" + user.getName() + " \t 原因: " + reason;
            }

            saveMsg(UserRole.MANAGER, pub, user, title, content);
            return BaseDto.newDto(APIStatus.success);
        }
        return BaseDto.failure("订单不正确,未发现派工信息");
    }

    private void setFixStatus(FixOrder order, User user) {

        String desc = order.getExt();
        if (desc.length() > 20) {
            order.setExt(desc.substring(0, 20)); // 取20位长度
        }
        if ("1".equals(order.getState())) {
            for (FixOrderServer u : order.getFixOrderServer()) {
                if (u.getUser().getId().equals(user.getId())) {
                    if (u.getState().equals("0")) {
                        order.setState("待接受派工");
                    } else {
                        order.setState("等待维修");
                    }
                    return;
                }
            }
            order.setState("已派工");
            return;
        }
        if ("2".equals(order.getState())) {
            order.setState("安装完成");
            return;
        }
    }

    @ResponseBody
    @RequestMapping("/srv/sign")
    public BaseDto updateForSrvState(Long id, String type, String longitude, String latitude) {
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        Order order = orderService.findById(id);
        if (order == null) {
            return BaseDto.failure("订单不正确,未发现派工信息");
        }

        if (StringUtils.isEmpty(longitude)) {
            longitude = "";
        }

        if (StringUtils.isEmpty(latitude)) {
            latitude = "";
        }

        String address = LocationRequest.getAddress(latitude, longitude);
        if (StringUtils.isBlank(address)) {
            address = "浙江省临海市江南街道汇丰南路328号";
            logger.warn("获取定位失败!!!");
        }

        Sign sign = new Sign();
        sign.setOrder(order);
        sign.setAddress(address);
        sign.setUser(user);
        sign.setType(type);
        sign.setTime(new Date());
        orderService.addSign(sign);

        String title = null, content = null;
        User pub = null;
        if (!CollectionUtils.isEmpty(order.getService())) {
            OrderServer server = order.getService().get(0);
            pub = server.getPub();
        }

        //1： 出发签到，2：到达签到，3：离开签到 '
        if ("1".equals(type)) {
            title = "订单派工出发签到";
            content = "订单编号" + order.getId() + " 服务人员：" + user.getName() + ",当前位置:" + address;
        } else if ("2".equals(type)) {
            title = "订单派工到达签到";
            content = "订单编号" + order.getId() + " 服务人员：" + user.getName() + ",当前位置:" + address;
        }
        if ("3".equals(type)) {
            title = "订单派工离开签到";
            content = "订单编号" + order.getId() + " 服务人员：" + user.getName() + ",当前位置:" + address;
        }

        saveMsg(UserRole.MANAGER, pub, user, title, content);

        return BaseDto.newDto(APIStatus.success);
    }


}
