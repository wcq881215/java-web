package com.csf.web.service;

import com.csf.web.entity.Order;
import com.csf.web.entity.OrderDevice;
import com.csf.web.entity.OrderServer;
import com.csf.web.entity.User;
import com.csf.web.repository.OrderDao;
import com.csf.web.repository.OrderDeviceDao;
import com.csf.web.repository.OrderServerDao;
import com.csf.web.util.OAUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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

    @Autowired
    private OrderServerDao orderServerDao;

    @Autowired
    private OrderDeviceDao orderDeviceDao;

    public OrderServer splitOrder(OrderServer orderServer) {
        return orderServerDao.save(orderServer);
    }



    public Order saveOrder(Order order) {

        if (order != null && order.getOrder_id() == null) {
            order.setOrder_id(OAUtil.generateOrderId());
        }
        return orderDao.save(order);
    }

    public OrderDevice saveOrderDevice(OrderDevice orderDevice) {
        return orderDeviceDao.save(orderDevice);
    }


    public Page<Order> queryUserAllOrder(User user, Integer page, Integer pageSize) {
        Pageable pageable = new PageRequest(page, pageSize);
        return orderDao.queryUserOrder(user.getId(), pageable);
    }

    public Page<Order> queryUserStateOrder(User user, String state, Integer page, Integer pageSize) {
        Pageable pageable = new PageRequest(page, pageSize);
        return orderDao.queryUserStateOrder(user.getId(), state, pageable);
    }

    public Page<Order> querySrvOrder(Integer page, Integer pageSize) {
        Pageable pageable = new PageRequest(page, pageSize);
        return orderDao.querySrvOrder(pageable);
    }


}
