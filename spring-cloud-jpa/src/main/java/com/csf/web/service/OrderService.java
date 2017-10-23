package com.csf.web.service;

import com.csf.web.entity.Order;
import com.csf.web.entity.User;
import com.csf.web.repository.OrderDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
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

    public Page<Order> queryWorkAllOrder(Integer page,Integer pageSize){
        Pageable pageable = new PageRequest(page,pageSize);
        return orderDao.findAll(pageable);
    }

    public Page<Order> queryWorkStateOrder(String state,Integer page,Integer pageSize){
        Pageable pageable = new PageRequest(page,pageSize);
        return orderDao.queryWorkStateOrder(state,pageable);
    }

    public Page<Order> queryProductOrder(Integer page,Integer pageSize){
        Pageable pageable = new PageRequest(page,pageSize);
        return orderDao.queryProductOrder(pageable);
    }

    public Page<Order> queryMyProductOrder(User user,Integer page,Integer pageSize){
        Pageable pageable = new PageRequest(page,pageSize);
        return orderDao.queryMyProductOrder(user,pageable);
    }
    public Page<Order> queryServicerProductOrder(User user,Integer page,Integer pageSize){
        Pageable pageable = new PageRequest(page,pageSize);
        return orderDao.queryServicerProductOrder(user,pageable);
    }

    public Page<Order> querySrvOrder(Integer page,Integer pageSize){
        Pageable pageable = new PageRequest(page,pageSize);
        return orderDao.querySrvOrder(pageable);
    }

    public Page<Order> queryPackOrder(Integer page,Integer pageSize){
        Pageable pageable = new PageRequest(page,pageSize);
        return orderDao.queryPackOrder(pageable);
    }

    public Page<Order> queryPackerrProductOrder(User user,Integer page,Integer pageSize){
        Pageable pageable = new PageRequest(page,pageSize);
        return orderDao.queryPackProductOrder(user,pageable);
    }


    public Order findById(Long id){
        return orderDao.findOne(id);
    }

}
