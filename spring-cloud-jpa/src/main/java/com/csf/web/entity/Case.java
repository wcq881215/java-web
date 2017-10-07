package com.csf.web.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by changqi.wu on 2017/8/8.
 */
@Entity
@Table(name = "app_case")
public class Case implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column
    private String title;
    @Column
    private String content;
    @Column
    private Boolean state;
    @Column
    private Date time;

    @OneToMany(mappedBy = "cid")
    private List<CaseImg> imgs;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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

    public List<CaseImg> getImgs() {
        return imgs;
    }

    public void setImgs(List<CaseImg> imgs) {
        this.imgs = imgs;
    }
}
