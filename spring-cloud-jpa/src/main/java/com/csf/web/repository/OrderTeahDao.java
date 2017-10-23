package com.csf.web.repository;

import com.csf.web.entity.Order;
import com.csf.web.entity.OrderTeah;
import com.csf.web.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;


/**
 * Created by changqi.wu on 17-10-23.
 */

public interface OrderTeahDao extends CrudRepository<OrderTeah, Long> {

    @Query("from OrderTeah o where o.user = :user ")
    public Page<OrderTeah> queryUserOrderTeah(@Param("user") User user, Pageable pageable);

    @Query("from OrderTeah o where o.user = :user and o.order = :order ")
    public OrderTeah queryUserOrderTeah(@Param("user") User user, @Param("order") Order order);

}
