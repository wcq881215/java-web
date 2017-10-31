package com.csf.web.service;

import com.csf.web.entity.Order;
import com.csf.web.entity.OrderTeah;
import com.csf.web.entity.User;
import com.csf.web.repository.OrderDao;
import com.csf.web.repository.OrderTeahDao;
import com.csf.web.util.OAUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

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
    private OrderTeahDao orderTeahDao;

    public OrderTeah splitOrder(OrderTeah orderTeah) {
        return orderTeahDao.save(orderTeah);
    }

    public Order saveOrder(Order order) {

        if(order !=null && order.getOrder_id() == null){
            order.setOrder_id(OAUtil.generateOrderId());
        }
        return orderDao.save(order);
    }

    public void delOrder(Long id) {
        orderDao.delete(id);
    }

    public void agreeTechOrder(Long id, User user) {
        Order order = orderDao.findOne(id);
        OrderTeah techOrder = orderTeahDao.queryUserOrderTeah(user, order);
        if (techOrder != null) {
            techOrder.setState("1");
            orderTeahDao.save(techOrder);
        }
    }

    public void delTechOrder(Long id, User user) {
        Order order = orderDao.findOne(id);
        OrderTeah techOrder = orderTeahDao.queryUserOrderTeah(user, order);
        if (techOrder != null) {
            orderTeahDao.delete(techOrder.getId());
        }
    }


    public Page<Order> queryUserAllOrder(User user, Integer page, Integer pageSize) {
        Pageable pageable = new PageRequest(page, pageSize);
        return orderDao.queryUserOrder(user.getId(), pageable);
    }

    public Page<Order> queryUserStateOrder(User user, String state, Integer page, Integer pageSize) {
        Pageable pageable = new PageRequest(page, pageSize);
        return orderDao.queryUserStateOrder(user.getId(), state, pageable);
    }

    public Page<Order> queryWorkAllOrder(Integer page, Integer pageSize) {
        Pageable pageable = new PageRequest(page, pageSize);
        return orderDao.findAll(pageable);
    }

    public Page<Order> queryWorkStateOrder(String state, Integer page, Integer pageSize) {
        Pageable pageable = new PageRequest(page, pageSize);
        return orderDao.queryWorkStateOrder(state, pageable);
    }

    public Page<Order> queryProductOrder(Integer page, Integer pageSize) {
        Pageable pageable = new PageRequest(page, pageSize);
        return orderDao.queryProductOrder(pageable);
    }

    public Page<Order> queryMyProductOrder(User user, Integer page, Integer pageSize) {
        Pageable pageable = new PageRequest(page, pageSize);
        return orderDao.queryMyProductOrder(user, pageable);
    }

    public Page<Order> queryServicerProductOrder(User user, Integer page, Integer pageSize) {
        Pageable pageable = new PageRequest(page, pageSize);
        return orderDao.queryServicerProductOrder(user, pageable);
    }

    public Page<Order> querySrvOrder(Integer page, Integer pageSize) {
        Pageable pageable = new PageRequest(page, pageSize);
        return orderDao.querySrvOrder(pageable);
    }

    public Page<Order> queryPackOrder(Integer page, Integer pageSize) {
        Pageable pageable = new PageRequest(page, pageSize);
        return orderDao.queryPackOrder(pageable);
    }

    public Page<Order> queryPackerrProductOrder(User user, Integer page, Integer pageSize) {
        Pageable pageable = new PageRequest(page, pageSize);
        return orderDao.queryPackProductOrder(user, pageable);
    }

    public Page<OrderTeah> queryPackerrOrder(User user, Integer page, Integer pageSize) {
        Pageable pageable = new PageRequest(page, pageSize);
        return orderTeahDao.queryUserOrderTeah(user, pageable);
    }


    public Order findById(Long id) {
        return orderDao.findOne(id);
    }

    public OrderTeah findTechOrder(Long id) {
        return orderTeahDao.findOne(id);
    }

    public List<OrderTeah> finishTechOrder(Order  order) {
        return orderTeahDao.queryOrderTeah(order);
    }


    public OrderTeah finishTechOrder(Long id) {
        OrderTeah orderTea = orderTeahDao.findOne(id);
        if (orderTea != null) {
            orderTea.setState("2");
            orderTeahDao.save(orderTea);
            Order order = orderTea.getOrder();
            if (order != null) {
                order.setState("4");
                orderDao.save(order);
            }
        }
        return orderTea;
    }

}
