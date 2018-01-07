package com.csf.web.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by changqi.wu on 17-10-12.
 */
@Entity
@Table(name = "app_advice")
public class Advice implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column
    private String content;
    @Column
    @JsonFormat(pattern = "yyyy-MM-dd" ,timezone = "GMT+8")
    private Date time;
    @Column
    private Boolean state;

    @ManyToOne(cascade = {CascadeType.MERGE,CascadeType.REFRESH }, optional = true)
    @JoinColumn(name = "uid")
    private User user;//发布人


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
