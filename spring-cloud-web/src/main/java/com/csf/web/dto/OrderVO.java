package com.csf.web.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by changqi.wu on 17-10-23.
 */
public class OrderVO implements Serializable {

    private Long pid;

    private String buser;

    private String bphone;

    private List<DeviceVo> device;

    private Double total;

    private String ext;

    private String remark;

    private String cust;

    private String address;

    private String phone;

    private String stime;

    private String dtime;

    private String driver;

    private String logistics;

    private String logphone;

    private Date time;

    private String state;//状态 0 无效（废弃，重录） 1 - 2 -3 -4 -5 ... -> over  1:内勤录入等待生产，2生产中待发货，3已发货待安装 4安装完成等待客户确认 5 已完成

    private Long proxy;

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
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

    public List<DeviceVo> getDevice() {
        return device;
    }

    public void setDevice(List<DeviceVo> device) {
        this.device = device;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
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

    public Long getProxy() {
        return proxy;
    }

    public void setProxy(Long proxy) {
        this.proxy = proxy;
    }
}
