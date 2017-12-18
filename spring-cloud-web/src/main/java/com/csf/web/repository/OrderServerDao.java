package com.csf.web.repository;

import com.csf.web.entity.Order;
import com.csf.web.entity.OrderServer;
import com.csf.web.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;


/**
 * Created by changqi.wu on 17-10-23.
 */

public interface OrderServerDao extends CrudRepository<OrderServer, Long> {

    @Query("from OrderServer o where o.user = :user ")
    public Page<OrderServer> queryUserOrderServer(@Param("user") User user, Pageable pageable);

    @Query("from OrderServer o where o.user = :user and o.order = :order ")
    public OrderServer queryUserOrderServer(@Param("user") User user, @Param("order") Long order);

    @Query("from OrderServer o where  o.order = :order and o.state <> -1 ")
    public List<OrderServer> queryOrderServer(@Param("order") Long order);

}
