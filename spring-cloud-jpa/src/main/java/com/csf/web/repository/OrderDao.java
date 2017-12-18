package com.csf.web.repository;


import com.csf.web.entity.Order;
import com.csf.web.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by changqi.wu on 17-10-5.
 */
public interface OrderDao extends JpaRepository<Order, Long> {

    @Query("from Order o where o.state <> 0 and o.pid = :pid ")
    public Page<Order> queryUserOrder(@Param("pid")Long pid, Pageable pageable);


    @Query("from Order o where o.state = :state and o.pid = :pid ")
    public Page<Order> queryUserStateOrder(@Param("pid")Long pid,@Param("state")String state, Pageable pageable);


    @Query("from Order o where o.state = :state ")
    public Page<Order> queryWorkStateOrder(@Param("state")String state, Pageable pageable);

    @Query("from Order o where o.state = 1 and o.producer is null ")
    public Page<Order> queryProductOrder(Pageable pageable);

    @Query("from Order o where o.state = 1 and o.producer = :user ")
    public Page<Order> queryMyProductOrder(@Param("user") User user, Pageable pageable);

    @Query("from Order o where o.state = 2 and o.service is null ")
    public Page<Order> querySrvOrder(Pageable pageable);

    @Query("from Order o where o.state = 2 and o.service = :user ")
    public Page<Order> queryServicerProductOrder(@Param("user") User user, Pageable pageable);

    @Query("from Order o where o.state = 3 and o.pack is null ")
    public Page<Order> queryPackOrder(Pageable pageable);

    @Query("from Order o where o.state = 3 and o.pack = :user ")
    public Page<Order> queryPackProductOrder(@Param("user") User user, Pageable pageable);

    @Query("select max(id) from Order ")
    public Long getMaxId();

}
