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
        saveMsg(UserRole.PRODUCTION, user, "您有一比新订单需要生产", "订单编号" + order.getId() + ",请在我的工单里面查收");
        return BaseDto.newDto(order);
    }


//    @ResponseBody
//    @RequestMapping("/add")
//    public BaseDto add(OrderVO order) {
//        System.out.println(JsonUtils.toJson(order));
//        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
//        order.setPid(user.getId());
//        order.setState("1");
//        order.setTime(new Date());
//        List<DeviceVo> devices = order.getDevice();
//        if(!CollectionUtils.isEmpty(devices)){
//            for(DeviceVo vo: devices) {
//
//                Device device = deviceService.findById(vo.getDid());
//                if (device != null) {
//                    vo.setSn(device.getSn());
//                    vo.setDname(device.getName());
//                    vo.setType(device.getType());
//                    vo.setPrice(device.getPrice());
//                    order.setTotal(device.getPrice() * vo.getNumber());
//                }
//            }
//        }
//
////        orderService.saveOrder(order);
//        return BaseDto.newDto(order);
//    }

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

    @ResponseBody
    @RequestMapping("/work/{status}")
    public BaseDto queryWork(@PathVariable("status") String status, Integer page, Integer pageSize) {
        if (page == null) {
            page = 0;
        }
        if (pageSize == null) {
            pageSize = 30;
        }
        if ("-1".equals(status)) {
            return BaseDto.newDto(orderService.queryWorkAllOrder(page, pageSize));
        } else {

            return BaseDto.newDto(orderService.queryWorkStateOrder(status, page, pageSize));
        }
    }

    @ResponseBody
    @RequestMapping("/product/select")
    public BaseDto queryForProduct(Integer page, Integer pageSize) {
        if (page == null) {
            page = 0;
        }
        if (pageSize == null) {
            pageSize = 30;
        }
        return BaseDto.newDto(orderService.queryProductOrder(page, pageSize));
    }

    @ResponseBody
    @RequestMapping("/product/query")
    public BaseDto queryMyProduct(Integer page, Integer pageSize) {
        if (page == null) {
            page = 0;
        }
        if (pageSize == null) {
            pageSize = 30;
        }
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        return BaseDto.newDto(orderService.queryMyProductOrder(user, page, pageSize));
    }

    @ResponseBody
    @RequestMapping("/service/query")
    public BaseDto queryServicerProduct(Integer page, Integer pageSize) {
        if (page == null) {
            page = 0;
        }
        if (pageSize == null) {
            pageSize = 30;
        }
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        return BaseDto.newDto(orderService.queryServicerProductOrder(user, page, pageSize));
    }

    @ResponseBody
    @RequestMapping("/manage/query")
    public BaseDto queryManage(Integer page, Integer pageSize) {
        if (page == null) {
            page = 0;
        }
        if (pageSize == null) {
            pageSize = 30;
        }
        return BaseDto.newDto(orderService.querySrvOrder(page, pageSize));
    }


    @RequestMapping("/product/detail/{id}")
    public String getMyOrderDetail(@PathVariable("id") Long id) {
        Order order = orderService.findById(id);
        if (order != null) {
            order.setState(OrderStatus.getStatusMsg(order.getState()));
        }
        attr("data", order);
        return "/order/detail_my";
    }

    @RequestMapping("/service/detail/{id}")
    public String getServiceOrderDetail(@PathVariable("id") Long id) {
        Order order = orderService.findById(id);
        if (order != null) {
            order.setState(OrderStatus.getStatusMsg(order.getState()));
        }
        attr("data", order);
        return "/order/detail_service";
    }

    @RequestMapping("/manage/detail/{id}")
    public String getManageOrderDetail(@PathVariable("id") Long id) {
        Order order = orderService.findById(id);
        if (order != null) {
            order.setState(OrderStatus.getStatusMsg(order.getState()));
        }
        attr("data", order);
        setStatus(order);
        return "/order/detail_manage";
    }

    private void setStatus(Order order) {
        if ("1".equals(order.getState()) && order.getProducer() == null) {
            order.setState("等待生产");
            return;
        }
        if ("1".equals(order.getState()) && order.getProducer() != null) {
            order.setState("生产中");
            return;
        }
        if ("2".equals(order.getState()) && order.getService() == null) {
            order.setState("生产完成待发货");
            return;
        }
        if ("2".equals(order.getState()) && order.getService() != null) {
            order.setState("已发货");
            return;
        }
        if ("3".equals(order.getState())) {
            order.setState("待安装");
            return;
        }
        if ("4".equals(order.getState())) {
            order.setState("安装完成");
            return;
        }
    }

    @RequestMapping("/service/split/{id}")
    public String splitOrderDetail(@PathVariable("id") Long id) {
        Order order = orderService.findById(id);
        boolean split = true;
        if (order != null) {
            order.setState(OrderStatus.getStatusMsg(order.getState()));
            List<OrderTeah> orderTech = orderService.finishTechOrder(order);
            if (CollectionUtils.isEmpty(orderTech)) {
                split = false;
            }

        }
        attr("data", order);
        attr("split", split);
        return "/order/split_service";
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

    @ResponseBody
    @RequestMapping("/pack/select")
    public BaseDto queryForPack(Integer page, Integer pageSize) {
        if (page == null) {
            page = 0;
        }
        if (pageSize == null) {
            pageSize = 30;
        }
        return BaseDto.newDto(orderService.queryProductOrder(page, pageSize));
    }

    @ResponseBody
    @RequestMapping("/tech/select")
    public BaseDto queryTechPack(Integer page, Integer pageSize) {
        if (page == null) {
            page = 0;
        }
        if (pageSize == null) {
            pageSize = 30;
        }
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        return BaseDto.newDto(orderService.queryPackerrOrder(user, page, pageSize));
    }


    @RequestMapping("/office/detail/{id}")
    public String getOrderDetail(@PathVariable("id") Long id) {
        Order order = orderService.findById(id);
        if (order != null) {
            order.setState(OrderStatus.getStatusMsg(order.getState()));
        }
        attr("data", order);
        return "/order/detail_order";
    }

    @RequestMapping("/work/detail/{id}")
    public String getUserOrderDetail(@PathVariable("id") Long id) {
        Order order = orderService.findById(id);
        if (order != null) {
            order.setState(OrderStatus.getStatusMsg(order.getState()));
        }
        attr("data", order);
        return "/order/detail";
    }


    @ResponseBody
    @RequestMapping("/product/accept/{id}")
    public BaseDto accept(@PathVariable("id") Long id) {
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        Order order = orderService.findById(id);
        order.setProducer(user);
        orderService.saveOrder(order);
        return BaseDto.newDto(APIStatus.success);
    }

    @ResponseBody
    @RequestMapping("/srv/accept/{id}")
    public BaseDto acceptSrv(@PathVariable("id") Long id) {
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        Order order = orderService.findById(id);
        order.setService(user);
        orderService.saveOrder(order);
        return BaseDto.newDto(APIStatus.success);
    }

    @ResponseBody
    @RequestMapping("/manage/wuliu/{id}")
    public BaseDto manageWuliu(@PathVariable("id") Long id, String logistics,
                               String iphone,
                               String driver,
                               String logphone,
                               String delatime) {
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        Order order = orderService.findById(id);
        if (order != null) {
            order.setLogistics(logistics);
            order.setIphone(iphone);
            order.setDriver(driver);
            order.setLogphone(logphone);
            order.setDelatime(delatime);
            logger.info("manager :  <id :" + user.getId() + " , name: " + user.getName() + "> has deliver order ：" + order.getId());
            order.setState("2");
        }
        orderService.saveOrder(order);
        return BaseDto.newDto(APIStatus.success);
    }


    @ResponseBody
    @RequestMapping("/finish/{id}")
    public BaseDto finish(@PathVariable("id") Long id, String status) {
        Order order = orderService.findById(id);
        order.setState(status);
        orderService.saveOrder(order);
        return BaseDto.newDto(APIStatus.success);
    }

    @ResponseBody
    @RequestMapping("/product/refuse/{id}")
    public BaseDto refuse(@PathVariable("id") Long id) {
        Order order = orderService.findById(id);
        order.setProducer(null);
        orderService.saveOrder(order);
        return BaseDto.newDto(APIStatus.success);
    }

    @ResponseBody
    @RequestMapping("/service/refuse/{id}")
    public BaseDto serviceRefuse(@PathVariable("id") Long id) {
        Order order = orderService.findById(id);
        order.setService(null);
        orderService.saveOrder(order);
        return BaseDto.newDto(APIStatus.success);
    }

    @ResponseBody
    @RequestMapping("/srv/split")
    public BaseDto serviceSplit(Long id, String uids) {
        Order order = orderService.findById(id);
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        if (StringUtils.isEmpty(uids)) {
            return BaseDto.newDto(APIStatus.param_error);
        }
        for (String uid : uids.split(",")) {
            Long ud = Long.parseLong(uid);
            User u = userService.findById(ud);
            OrderTeah orderTeah = new OrderTeah();
            orderTeah.setOrder(order);
            orderTeah.setService(user);
            orderTeah.setState("0");
            orderTeah.setTime(new Date());
            orderTeah.setUser(u);
            orderService.splitOrder(orderTeah);

        }
        return BaseDto.newDto(APIStatus.success);
    }


    @ResponseBody
    @RequestMapping("/delete/{id}")
    public BaseDto deleteOrder(@PathVariable("id") Long id) {
        orderService.delOrder(id);
        return BaseDto.newDto(APIStatus.success);
    }

    @ResponseBody
    @RequestMapping("/tech/finish/{id}")
    public BaseDto finishOrder(@PathVariable("id") Long id) {
        orderService.finishTechOrder(id);
        return BaseDto.newDto(APIStatus.success);
    }


    @RequestMapping("/edit/{id}")
    public String queryOrderDetail(@PathVariable("id") Long id) {
        Order order = orderService.findById(id);
        attr("data", order);
        return "/order/editOrder";
    }

    @RequestMapping("/tech/detail/{id}")
    public String queryTechOrderDetail(@PathVariable("id") Long id) {
        OrderTeah tech = orderService.findTechOrder(id);
        Order order = tech.getOrder();
        attr("data", order);
        attr("tech_order", tech);
        return "/order/tech_order";
    }

    @ResponseBody
    @RequestMapping("/tech/delete/{id}")
    public BaseDto deleteTechOrder(@PathVariable("id") Long id) {
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        orderService.delTechOrder(id, user);
        return BaseDto.newDto(APIStatus.success);
    }

    @ResponseBody
    @RequestMapping("/tech/agree/{id}")
    public BaseDto agreeTechOrder(@PathVariable("id") Long id) {
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        orderService.agreeTechOrder(id, user);
        return BaseDto.newDto(APIStatus.success);
    }


    @ResponseBody
    @RequestMapping("/update")
    public BaseDto updateOrder(Order order) {
        Order o = orderService.findById(order.getId());
        if (o != null) {
            o.setProxy(order.getProxy());
            Device device = deviceService.findById(order.getDid());
            if (device != null) {
                o.setSn(device.getSn());
                o.setDevice(device.getName());
                o.setType(device.getType());
                o.setPrice(device.getPrice());
                o.setTotal(device.getPrice() * order.getNumber());
                o.setNumber(order.getNumber());
            }
            o.setRemark(order.getRemark());
            o.setExt(order.getExt());
            o.setPhone(order.getPhone());
            o.setAddress(order.getAddress());
            o.setBphone(order.getBphone());
            o.setBuser(order.getBuser());
            o.setCust(order.getCust());
            o.setStime(order.getStime());
            o.setDtime(order.getDtime());
        }

        orderService.saveOrder(o);
        return BaseDto.newDto(APIStatus.success);
    }

}
