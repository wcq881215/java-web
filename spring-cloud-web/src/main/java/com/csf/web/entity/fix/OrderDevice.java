//package com.csf.web.entity.fix;
//
//import com.csf.web.entity.Device;
//import com.csf.web.entity.User;
//
//import javax.persistence.*;
//
///**
// * Created by changqi.wu on 17-10-29.
// */
//@Entity
//@Table(name = "app_order_device")
//public class OrderDevice {
//
//    @Id
//    @GeneratedValue(strategy = GenerationType.AUTO)
//    private Long id;
//
//    @OneToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, optional = true)
//    @JoinColumn(name = "order_id")
//    private Order order;
//
//    @OneToOne(cascade = {CascadeType.MERGE,CascadeType.REFRESH }, optional = true)
//    private Device device;//订单
//
//
//    public Long getId() {
//        return id;
//    }
//
//    public void setId(Long id) {
//        this.id = id;
//    }
//
//    public Order getOrder() {
//        return order;
//    }
//
//    public void setOrder(Order order) {
//        this.order = order;
//    }
//
//    public Device getDevice() {
//        return device;
//    }
//
//    public void setDevice(Device device) {
//        this.device = device;
//    }
//}
