//package com.csf.web.entity.fix;
//
//import com.csf.web.entity.User;
//import com.fasterxml.jackson.annotation.JsonFormat;
//
//import javax.persistence.*;
//import java.util.Date;
//import java.util.List;
//
///**
// * Created by changqi.wu on 17-10-29.
// */
//@Entity
//@Table(name = "app_orders")
//public class Order {
//
//    @Id
//    @GeneratedValue(strategy = GenerationType.AUTO)
//    private Long id;
//    @Column
//    private String order_id;
//    @Column
//    private Long pid;
//    @Column
//    private String buser;
//    @Column
//    private String bphone;
//
//    @OneToMany(cascade = {CascadeType.MERGE, CascadeType.REFRESH},mappedBy="order_id")
//    private List<OrderDevice> devices;
//
//    @Column
//    private String ext;
//    @Column
//    private String remark;
//    @Column
//    private String cust;
//    @Column
//    private String address;
//    @Column
//    private String phone;
//    @Column
//    private String stime;
//    @Column
//    private String dtime;
//    @Column
//    private String driver;
//    @Column
//    private String logistics;
//    @Column
//    private String logphone;
//    @Column
//    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
//    private Date time;
//    @Column
//    private String state;//状态 0 无效（废弃，重录） 1 - 2 -3 -4 -5 ... -> over  1:内勤录入等待生产，2生产中待发货，3已发货待安装 4安装完成等待客户确认 5 已完成
//    @Column
//    private Long proxy;
//
//    @OneToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, optional = true)
//    @JoinColumn(name = "fqid")
//    private com.csf.web.entity.Order dirty;//废弃订单
//
//    @OneToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, optional = true)
//    @JoinColumn(name = "prod")
//    private User producer;//生产人
//
//    @OneToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, optional = true)
//    @JoinColumn(name = "srv")
//    private User service;//售后服务
//
//    @OneToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, optional = true)
//    @JoinColumn(name = "pack")
//    private User pack;//安装
//
//
//}
