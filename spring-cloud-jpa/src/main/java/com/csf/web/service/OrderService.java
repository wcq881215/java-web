package com.csf.web.service;

import com.csf.web.entity.Order;
import com.csf.web.entity.User;
import com.csf.web.repository.OrderDao;
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


    public Order saveOrder(Order order){
        return orderDao.save(order);
    }

    public Page<Order> queryUserAllOrder(User user,Integer page,Integer pageSize){
        Pageable pageable = new PageRequest(page,pageSize);
       return orderDao.queryUserOrder(user.getId(),pageable);
    }

    public Page<Order> queryUserStateOrder(User user,String state,Integer page,Integer pageSize){
        Pageable pageable = new PageRequest(page,pageSize);
        return orderDao.queryUserStateOrder(user.getId(),state,pageable);
    }

}
