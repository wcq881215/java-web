package com.csf.web.service;

import com.csf.web.entity.Order;
import com.csf.web.entity.OrderDevice;
import com.csf.web.entity.OrderServer;
import com.csf.web.repository.OrderDao;
import com.csf.web.repository.OrderServerDao;
import com.csf.web.util.OAUtil;
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

    @Autowired
    private OrderServerDao orderServerDao;

    public OrderServer splitOrder(OrderServer orderServer) {
        return orderServerDao.save(orderServer);
    }

    public Order saveOrder(Order order) {

        if (order != null && order.getOrder_id() == null) {
            order.setOrder_id(OAUtil.generateOrderId());
        }
        return orderDao.save(order);
    }


}
