package com.csf.web.service;

import com.csf.web.entity.*;
import com.csf.web.repository.OrderDao;
import com.csf.web.repository.OrderDeviceDao;
import com.csf.web.repository.OrderServerDao;
import com.csf.web.repository.SignDao;
import com.csf.web.util.OAUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.transaction.Transactional;
import java.util.List;

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

    @Autowired
    private SignDao signDao;

    public OrderServer splitOrder(OrderServer orderServer) {
        return orderServerDao.save(orderServer);
    }

    public boolean isExit(Order order, User user) {
        OrderServer orderUser = orderServerDao.queryUserOrderServer(user, order.getId());
        if (orderUser == null || orderUser.getId() == null) {
            return false;
        }
        return true;
    }

    public Order saveOrder(Order order) {

        if (order != null && order.getOrder_id() == null) {
            order.setOrder_id(OAUtil.generateOrderId());
        }
        return orderDao.save(order);
    }

    public Sign addSign(Sign sign) {
        Sign sig = signDao.findUserOrderTypeSign(sign.getUser(), sign.getOrder(), sign.getType());
        if (sig != null && sig.getId() != null){
            sig.setAddress(sign.getAddress());
            return signDao.save(sig);
        }
        return signDao.save(sign);
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

    public Page<Order> queryMgrOrder(Integer page, Integer pageSize) {
        Pageable pageable = new PageRequest(page, pageSize);
        return orderDao.queryMgrOrder(pageable);
    }

    public Order findById(Long id) {
        return orderDao.findOne(id);
    }

    public void delOrder(Long id) {
        orderDeviceDao.deleteByOid(id);
        orderDao.delete(id);
    }

    public boolean sign(User user,Order order){
       List<Sign> sings =  signDao.findUserTypeSign(user,order);
        if(sings !=null  && sings.size() == 3){
            return true;
        }
        return false;
    }

    public Page<Order> querySrvOrder(Integer page, Integer pageSize) {
        Pageable pageable = new PageRequest(page, pageSize);
        return orderDao.querySrvOrder(pageable);
    }

    public Page<Order> querySplitOrder(Integer page, Integer pageSize) {
        Pageable pageable = new PageRequest(page, pageSize);
        Integer offset = page * pageSize;
        List<Order> contents = orderDao.querySplitOrder(offset, pageSize);
        Long total = orderDao.querySplitOrderNo();
        Page<Order> data = new PageImpl<Order>(contents, pageable, total);
        return data;
    }


    public Page<Order> querySrvUserSplitOrder(User user, Integer page, Integer pageSize) {
        Pageable pageable = new PageRequest(page, pageSize);
        Integer offset = page * pageSize;
        List<Order> contents = orderDao.querySrvOrder(user.getId(), offset, pageSize);
        Long total = orderDao.querySrvOrderNo(user.getId());
        Page<Order> data = new PageImpl<Order>(contents, pageable, total);
        return data;
    }

    public Page<Order> querySrvUserOrder(User user, Integer page, Integer pageSize) {
        Pageable pageable = new PageRequest(page, pageSize);
        Integer offset = page * pageSize;
        List<Order> contents = orderDao.queryUserSrvOrder(user.getId(), offset, pageSize);
        Long total = orderDao.queryUserSrvOrderNo(user.getId());
        Page<Order> data = new PageImpl<Order>(contents, pageable, total);
        return data;
    }

    public OrderServer findOrderServerById(Long id) {
        return orderServerDao.findOne(id);
    }

    public void updateOrderSrvState(OrderServer orderServer) {
        orderServerDao.save(orderServer);
    }

}
