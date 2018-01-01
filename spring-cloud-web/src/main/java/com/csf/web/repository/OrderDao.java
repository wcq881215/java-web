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

    @Query("from Order o where o.state <> 0 and o.pub.id = :pid  ORDER  by o.time desc ")
    public Page<Order> queryUserOrder(@Param("pid")Long pid, Pageable pageable);


    @Query("from Order o where o.state = :state and o.pub.id = :pid ORDER  by o.time desc")
    public Page<Order> queryUserStateOrder(@Param("pid")Long pid,@Param("state")String state, Pageable pageable);


    @Query("from Order o where o.state = :state ORDER  by o.time desc")
    public Page<Order> queryWorkStateOrder(@Param("state")String state, Pageable pageable);

    @Query("select max(id) from Order ")
    public Long getMaxId();


    @Query("from Order o where o.state  in (2,3,4,5)  ORDER  by o.time desc ")
    public Page<Order> queryMgrOrder(Pageable pageable);

    @Query("from Order o where o.state = 1 ORDER  by o.time desc")
    public Page<Order> querySrvOrder(Pageable pageable);

    /**
     * 查询未派工订单
     * @return
     */
    @Query(value = "select  * from app_order o where o.state = 2 and o.id  not in (select order_id from app_order_tech ) ORDER  by o.time desc limit ?,? ",nativeQuery = true)
    public List<Order> querySplitOrder(Integer offset,Integer limit);

    /**
     * 查询未派工订单数量
     * @return
     */
    @Query(value = "select  count(*) from app_order o where o.state = 2 and o.id  not in (select order_id from app_order_tech ) ",nativeQuery = true)
    public Long querySplitOrderNo();


    /**
     * 查询被服务派工订单
     * @param uid
     * @param offset
     * @param limit
     * @return
     */
    @Query(value = "select  * from app_order o where o.state = 2 and o.id   in (select t.order_id from app_order_tech t where t.uid = ? and t.state = 0 ) ORDER  by o.time desc limit ?,? ",nativeQuery = true)
    public List<Order> querySrvOrder(Long uid,Integer offset,Integer limit);

    /**
     * 查询被服务派工订单 数量
     * @param uid
     * @return
     */
    @Query(value = "select  count(*) from app_order o where o.state = 2 and o.id  in (select t.order_id from app_order_tech t where t.uid = ? and t.state =0 ) ",nativeQuery = true)
    public Long querySrvOrderNo(Long uid);

    /**
     *查询服务用户订单
     * @param uid
     * @param offset
     * @param limit
     * @return
     */
    @Query(value = "select  * from app_order o where  o.id   in (select t.order_id from app_order_tech t where t.uid = ? and t.state <> -1) ORDER  by o.time desc  limit ?,? ",nativeQuery = true)
    public List<Order> queryUserSrvOrder(Long uid,Integer offset,Integer limit);

    /**
     *查询服务用户订单数量
     * @param uid
     * @return
     */
    @Query(value = "select  count(*) from app_order o where  o.id  in (select order_id from app_order_tech t where t.uid = ? and t.state <> -1) ",nativeQuery = true)
    public Long queryUserSrvOrderNo(Long uid);

}
