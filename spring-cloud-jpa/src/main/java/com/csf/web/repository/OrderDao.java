package com.csf.web.repository;


import com.csf.web.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by changqi.wu on 17-10-5.
 */
public interface OrderDao extends JpaRepository<Order, Long> {
}
