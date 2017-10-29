package com.csf.web.service;

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

    private static ServiceUtil util;

    @PostConstruct
    private void init(){
        util = this;
        util.orderDao = this.orderDao;
    }

    public static Long getMaxId(){
       return util.orderDao.getMaxId();
    }


}
