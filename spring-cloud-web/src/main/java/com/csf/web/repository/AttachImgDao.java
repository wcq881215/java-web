package com.csf.web.repository;

import com.csf.web.entity.AttachImg;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by Administrator on 2017/12/29.
 */
public interface AttachImgDao extends JpaRepository<AttachImg, Long> {

    @Query("delete  from AttachImg where aid = ?1")
    @Modifying
    void deleteByAid(Long aid);
}
