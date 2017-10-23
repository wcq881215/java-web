package com.csf.web.rest.pub;

import com.csf.web.constants.OAConstants;
import com.csf.web.dto.APIStatus;
import com.csf.web.dto.BaseDto;
import com.csf.web.dto.DeviceVo;
import com.csf.web.dto.OrderVO;
import com.csf.web.entity.Device;
import com.csf.web.entity.Order;
import com.csf.web.entity.OrderStatus;
import com.csf.web.entity.User;
import com.csf.web.rest.APIService;
import com.csf.web.service.DeviceService;
import com.csf.web.service.OrderService;
import com.csf.web.util.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
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
        if ("-1".equals(status)) {
            return BaseDto.newDto(orderService.queryUserAllOrder(user, page, pageSize));
        } else {

            return BaseDto.newDto(orderService.queryUserStateOrder(user, status, page, pageSize));
        }
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
    @RequestMapping("/finish/{id}")
    public BaseDto finish(@PathVariable("id") Long id,String status) {
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

}
