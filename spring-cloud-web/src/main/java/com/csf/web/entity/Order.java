package com.csf.web.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

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
    @OneToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, optional = true)
    @JoinColumn(name = "pid")
    private User pub;
    @OneToMany
    private List<OrderDevice> devices;
    @Column
    private String buser;
    @Column
    private String bphone;
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
    private String logistics;
    @Column
    private String iphone;
    @Column
    private String driver;
    @Column
    private String logphone;
    @Column
    private String delatime;
    @Column
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date time;
    @Column
    private String state;//状态 0 无效（废弃，重录） 1 - 2 -3 -4 -5 ... -> over  1 内勤录入等待发货，2已发货待安装 3安装完成等待客户确认 4 已完成
    @Column
    private Long proxy;
    @OneToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, optional = true)
    @JoinColumn(name = "fqid")
    private Order dirty;//废弃订单
    @OneToMany(cascade = {CascadeType.MERGE, CascadeType.REFRESH})
    @JoinColumn(name = "srv")
    private List<User> service;//服务派工


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public User getPub() {
        return pub;
    }

    public void setPub(User pub) {
        this.pub = pub;
    }

    public List<OrderDevice> getDevices() {
        return devices;
    }

    public void setDevices(List<OrderDevice> devices) {
        this.devices = devices;
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

    public String getExt() {
        return ext;
    }

    public void setExt(String ext) {
        this.ext = ext;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getCust() {
        return cust;
    }

    public void setCust(String cust) {
        this.cust = cust;
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

    public String getDtime() {
        return dtime;
    }

    public void setDtime(String dtime) {
        this.dtime = dtime;
    }

    public String getLogistics() {
        return logistics;
    }

    public void setLogistics(String logistics) {
        this.logistics = logistics;
    }

    public String getIphone() {
        return iphone;
    }

    public void setIphone(String iphone) {
        this.iphone = iphone;
    }

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public String getLogphone() {
        return logphone;
    }

    public void setLogphone(String logphone) {
        this.logphone = logphone;
    }

    public String getDelatime() {
        return delatime;
    }

    public void setDelatime(String delatime) {
        this.delatime = delatime;
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

    public Long getProxy() {
        return proxy;
    }

    public void setProxy(Long proxy) {
        this.proxy = proxy;
    }

    public Order getDirty() {
        return dirty;
    }

    public void setDirty(Order dirty) {
        this.dirty = dirty;
    }

    public List<User> getService() {
        return service;
    }

    public void setService(List<User> service) {
        this.service = service;
    }
}
