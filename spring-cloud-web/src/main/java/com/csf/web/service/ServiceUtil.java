package com.csf.web.service;

import com.csf.web.entity.User;
import com.csf.web.repository.OrderDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * Created by changqi.wu on 17-10-25.
 */
@Component
public class ServiceUtil {

    @Autowired
    private OrderDao orderDao;

    @Autowired
    private UserService userService;

    private static ServiceUtil util;

    @PostConstruct
    private void init(){
        util = this;
        util.orderDao = this.orderDao;
        util.userService = this.userService;
    }

    public static Long getMaxId(){
       return util.orderDao.getMaxId();
    }

    public static User login(String username, String password){
       return util.userService.login(username,password);
    }


}
