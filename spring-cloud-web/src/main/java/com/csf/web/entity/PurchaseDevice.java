package com.csf.web.entity;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * Created by changqi.wu on 2017/8/8.
 */
@Entity
@Table(name = "app_purchase_device")
public class PurchaseDevice {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @OneToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, optional = true)
    @JoinColumn(name = "pid")
    private User pub;
    @Column(name = "_name")
    private String name;
    @Column
    private String type;
    @Column
    private String remark;
    @Column
    private Integer number;
    @Column
    private Integer state;
    @Column
    private Date time;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public User getPub() {
        return pub;
    }

    public void setPub(User pub) {
        this.pub = pub;
    }
}
