package com.csf.web.entity;

import javax.persistence.*;

/**
 * Created by changqi.wu on 17-11-6.
 */
@Entity
@Table(name = "app_order_device")
public class OrderDevice {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @OneToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, optional = true)
    @JoinColumn(name = "did")
    private Device device;
    @Column
    private Double weight;
    @Column
    private Integer numb;

    @Column
    private Long oid;

    public Long getOid() {
        return oid;
    }

    public void setOid(Long oid) {
        this.oid = oid;
    }

    //    @ManyToOne(cascade = {CascadeType.MERGE,CascadeType.REFRESH }, optional = true)
//    @JoinColumn(name = "oid")
//    private Order order;
//
//    public Order getOrder() {
//        return order;
//    }
//
//    public void setOrder(Order order) {
//        this.order = order;
//    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Device getDevice() {
        return device;
    }

    public void setDevice(Device device) {
        this.device = device;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    public Integer getNumb() {
        return numb;
    }

    public void setNumb(Integer numb) {
        this.numb = numb;
    }
}
