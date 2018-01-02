package com.csf.web.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by changqi.wu on 17-10-12.
 */
@Entity
@Table(name = "app_attach")
public class Attach implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne(cascade = {CascadeType.MERGE,CascadeType.REFRESH }, optional = true)
    @JoinColumn(name = "uid")
    private User user;//发布人

    @Column
    private String name;

    @Column
    private Double price;

    @Column
    private String product;

    @Column(name = "_desc")
    private String desc;

    @Column
    private Date time;
    @Column
    private Boolean state;

    @OneToMany(mappedBy = "aid")
    private List<AttachImg> imgs;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
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

    public List<AttachImg> getImgs() {
        return imgs;
    }

    public void setImgs(List<AttachImg> imgs) {
        this.imgs = imgs;
    }
}
