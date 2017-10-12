package com.csf.web.service;

import com.csf.web.entity.Order;
import com.csf.web.repository.OrderDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

/**
 * Created by changqi.wu on 17-10-13.
 */
@Service
@Transactional
public class OrderService {

    @Autowired
    private OrderDao orderDao;


    public Order saveOrder(Order order){
        return orderDao.save(order);
    }

}
