package com.csf.web.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by changqi.wu on 17-10-5.
 */
@Entity
@Table(name = "app_order")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column
    private String order_id;
    @Column
    private Long pid;
    @Column
    private String buser;
    @Column
    private String bphone;
    @Column
    private String sn;
    @Column
    private Long did;
    @Column
    private String device;
    @Column
    private String type;
    @Column
    private Integer number;
    @Column
    private Double price;
    @Column
    private Double total;
    @Column
    private String ext;
    @Column
    private String remark;
    @Column
    private String cust;
    @Column
    private String address;
    @Column
    private String phone;
    @Column
    private String stime;
    @Column
    private String dtime;
    @Column
    private String driver;
    @Column
    private String logistics;
    @Column
    private String logphone;
    @Column
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date time;
    @Column
    private String state;//状态 0 无效（废弃，重录） 1 - 2 -3 -4 -5 ... -> over  1:内勤录入等待生产，2生产中待发货，3已发货待安装 4安装完成等待客户确认 5 已完成
    @Column
    private Long proxy;

    @OneToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, optional = true)
    @JoinColumn(name = "fqid")
    private Order dirty;//废弃订单

    @OneToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, optional = true)
    @JoinColumn(name = "prod")
    private User producer;//生产人

    @OneToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, optional = true)
    @JoinColumn(name = "srv")
    private User service;//售后服务

    @OneToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, optional = true)
    @JoinColumn(name = "pack")
    private User pack;//安装

    public User getProducer() {
        return producer;
    }

    public void setProducer(User producer) {
        this.producer = producer;
    }

    public User getService() {
        return service;
    }

    public void setService(User service) {
        this.service = service;
    }

    public User getPack() {
        return pack;
    }

    public void setPack(User pack) {
        this.pack = pack;
    }

    public Order getDirty() {
        return dirty;
    }

    public void setDirty(Order dirty) {
        this.dirty = dirty;
    }

    public Long getDid() {
        return did;
    }

    public void setDid(Long did) {
        this.did = did;
    }

    public String getCust() {
        return cust;
    }

    public void setCust(String cust) {
        this.cust = cust;
    }

    public Long getProxy() {
        return proxy;
    }

    public void setProxy(Long proxy) {
        this.proxy = proxy;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public String getDevice() {
        return device;
    }

    public void setDevice(String device) {
        this.device = device;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getStime() {
        return stime;
    }

    public void setStime(String stime) {
        this.stime = stime;
    }

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public String getLogistics() {
        return logistics;
    }

    public void setLogistics(String logistics) {
        this.logistics = logistics;
    }

    public String getLogphone() {
        return logphone;
    }

    public void setLogphone(String logphone) {
        this.logphone = logphone;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public String getExt() {
        return ext;
    }

    public void setExt(String ext) {
        this.ext = ext;
    }

    public String getDtime() {
        return dtime;
    }

    public void setDtime(String dtime) {
        this.dtime = dtime;
    }

    public String getBuser() {
        return buser;
    }

    public void setBuser(String buser) {
        this.buser = buser;
    }

    public String getBphone() {
        return bphone;
    }

    public void setBphone(String bphone) {
        this.bphone = bphone;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }
}
