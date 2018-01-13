package com.csf.web.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * Created by changqi.wu on 17-10-5.
 */
@Entity
@Table(name = "app_fix_order")
public class FixOrder {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @OneToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, optional = true)
    @JoinColumn(name = "pid")
    private User pub;
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
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date time;
    @Column
    private String state;//状态 0 无效（废弃，重录） 1 - 2 -3 -4 -5 ... -> over  1 内勤录入等待发货，2已发货待安装 3安装完成等待客户确认 4 已完成
    @OneToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, optional = true)
    @JoinColumn(name = "fqid")
    private FixOrder dirty;//废弃订单
    @OneToMany(mappedBy = "order")
    private List<FixOrderServer> fixOrderServer;//服务派工


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getPub() {
        return pub;
    }

    public void setPub(User pub) {
        this.pub = pub;
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

    public FixOrder getDirty() {
        return dirty;
    }

    public void setDirty(FixOrder dirty) {
        this.dirty = dirty;
    }

    public List<FixOrderServer> getFixOrderServer() {
        return fixOrderServer;
    }

    public void setFixOrderServer(List<FixOrderServer> fixOrderServer) {
        this.fixOrderServer = fixOrderServer;
    }
}
