package com.csf.web.repository;

import com.csf.web.entity.FixOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by changqi.wu on 18-1-12.
 */
public interface FixOrderDao extends JpaRepository<FixOrder, Long> {

    @Query(value = "select  * from app_fix_order o where o.state = 1 and o.id   in (select t.order_id from app_fix_server t where t.uid = ? and t.state = 0 ) ORDER  by o.time desc limit ?,? ",nativeQuery = true)
    List<FixOrder> querySrvOrder(Long id, Integer offset, Integer pageSize);

    @Query(value = "select  count(*) from app_fix_order o where o.state = 1 and o.id  in (select t.order_id from app_fix_server t where t.uid = ? and t.state =0 ) ",nativeQuery = true)
    Long querySrvOrderNo(Long id);
}
