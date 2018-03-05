package com.csf.web.repository;

import com.csf.web.entity.VideoSrc;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by changqi.wu on 17-10-15.
 */
public interface VideoSrcDao extends JpaRepository<VideoSrc, Long> {


    @Query("delete  from VideoSrc where vid = ?1 ")
    @Modifying
    @Transactional
    void deleteByVid(Long id);
}
