package com.csf.web.entity;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * Created by changqi.wu on 2017/8/8.
 */
@Entity
@Table(name = "app_device")
public class Device {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column
    private String sn;
    @Column(name = "_name")
    private String name;
    @Column(name = "_desc")
    private String desc;
    @Column
    private String type;
    //办事处
    @OneToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, optional = true)
    @JoinColumn(name = "pid")
    private Proxy proxy;
    @Column
    private Integer number;
    @Column
    private Double price;
    @Column
    private Boolean state;
    @Column
    private Date time;

    @OneToMany(mappedBy = "did")
    private List<DeviceImg> imgs;

    public List<DeviceImg> getImgs() {
        return imgs;
    }

    public void setImgs(List<DeviceImg> imgs) {
        this.imgs = imgs;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
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

    public Boolean getState() {
        return state;
    }

    public void setState(Boolean state) {
        this.state = state;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Proxy getProxy() {
        return proxy;
    }

    public void setProxy(Proxy proxy) {
        this.proxy = proxy;
    }
}
