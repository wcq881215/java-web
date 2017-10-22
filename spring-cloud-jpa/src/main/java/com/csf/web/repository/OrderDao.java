package com.csf.web.repository;


import com.csf.web.entity.Order;
import com.csf.web.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * Created by changqi.wu on 17-10-5.
 */
public interface OrderDao extends JpaRepository<Order, Long> {

    @Query("from Order o where o.state <> 0 and o.pid = :pid ")
    public Page<Order> queryUserOrder(@Param("pid")Long pid, Pageable pageable);


    @Query("from Order o where o.state = :state and o.pid = :pid ")
    public Page<Order> queryUserStateOrder(@Param("pid")Long pid,@Param("state")String state, Pageable pageable);

}
