package com.csf.web.entity;

import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by changqi.wu on 17-10-12.
 */
@Entity
@Table(name = "app_sign")
public class Sign implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, optional = true)
    @JoinColumn(name = "uid")
    private User user;//签到服务人员

    @ManyToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, optional = true)
    @JoinColumn(name = "oid")
    private Order order;//订单

    @ManyToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, optional = true)
    @JoinColumn(name = "fid")
    private FixOrder fixOrder;//订单

    @Autowired
    @Enumerated(EnumType.STRING)
    private SignOrderType catalog;

    @Column
    private Double longitude;

    @Column
    private Double latitude;

    @Column
    private String address;

    @Column
    private String type;

    @Column
    private Date time;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public FixOrder getFixOrder() {
        return fixOrder;
    }

    public void setFixOrder(FixOrder fixOrder) {
        this.fixOrder = fixOrder;
    }

    public SignOrderType getCatalog() {
        return catalog;
    }

    public void setCatalog(SignOrderType catalog) {
        this.catalog = catalog;
    }
}
