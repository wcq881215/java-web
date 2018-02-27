package com.csf.web.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by changqi.wu on 17-10-12.
 */
@Entity
@Table(name = "app_proxy")
public class Proxy implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column
    private String pname;
    @Column
    private String area;
    @Column
    private String address;
    @Column
    private String phone;
    @Column
    private String leader;
    @Column
    private String lmobile;
    @Column
    private String groups;
    @Column
    private Date time;
    @Column
    private Boolean state;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
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

    public String getLeader() {
        return leader;
    }

    public void setLeader(String leader) {
        this.leader = leader;
    }

    public String getLmobile() {
        return lmobile;
    }

    public void setLmobile(String lmobile) {
        this.lmobile = lmobile;
    }

    public String getGroups() {
        return groups;
    }

    public void setGroups(String groups) {
        this.groups = groups;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Boolean getState() {
        return state;
    }

    public void setState(Boolean state) {
        this.state = state;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }
}
