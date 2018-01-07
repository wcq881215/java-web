package com.csf.web.rest.fronts;

import com.csf.web.entity.Attach;
import com.csf.web.entity.Order;
import com.csf.web.entity.User;
import com.csf.web.rest.APIService;
import com.csf.web.rest.AttacheService;
import com.csf.web.service.OrderService;
import com.csf.web.service.UserService;
import com.csf.web.util.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Administrator on 2018/1/6.
 */
@Controller
@RequestMapping("/fronts")
public class ActionController extends APIService {


    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private AttacheService attacheService;


    @RequestMapping("/user/login")
    public String login(String username, String password) {
        System.out.println(String.format(" user %s ,password %s", username, password));

        return "/facade/home";
    }

    @RequestMapping("/user/list")
    public String userList(String name, String mobile, String area,@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "30") Integer pageSize) {
        page = page - 1; //实际下标  ： 页码 -1
        System.out.println(String.format(" user name %s ,mobile %s", name, mobile));
        Page<User> data = userService.findUser(name, mobile, area,page, pageSize);
        attr("data", data);
        return "/facade/userListAjax";
    }

    @RequestMapping("/user/list/ajax")
    @ResponseBody
    public Page userListAjax(String name, String mobile, String area,@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "30") Integer pageSize) {
        System.out.println(String.format(" user name %s ,mobile %s", name, mobile));
        Page<User> data = userService.findUser(name, mobile,area, page, pageSize);
        return data;
    }

    @RequestMapping("/order/list")
    public String orderList(String name, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "30") Integer pageSize) {
        System.out.println(String.format(" user %s ，", name));
        page = page - 1; //实际下标  ： 页码 -1
        Page<Order> data = orderService.queryMgrOrder(page, pageSize);
        attr("data", data);
        return "/facade/orderListAjax";
    }

    @RequestMapping("/attach/list")
    public String attachList(String name, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "30") Integer pageSize) {
        System.out.println(String.format(" user %s , ", name));
        page = page - 1; //实际下标  ： 页码 -1
        Sort sort = new Sort(Sort.Direction.DESC,"time");
        Pageable pageable = new PageRequest(page,pageSize);
        Page<Attach> data = attacheService.searchAttach(name, pageable);
        attr("data", data);
        return "/facade/attachListAjax";
    }


}
