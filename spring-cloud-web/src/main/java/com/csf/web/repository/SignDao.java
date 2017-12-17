package com.csf.web.repository;

import com.csf.web.entity.Order;
import com.csf.web.entity.Sign;
import com.csf.web.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by changqi.wu on 17-10-12.
 */
public interface SignDao extends JpaRepository<Sign, Long> {

    @Query("from Sign u where u.user=:user and u.order = :order and u.type = :type")
    public Sign findUserOrderTypeSign(@Param("user") User user, @Param("order") Order order, @Param("type") String type);

    @Query("from Sign u where u.user=:user and u.order = :order")
    List<Sign> findUserTypeSign(@Param("user") User user, @Param("order") Order order);

}
