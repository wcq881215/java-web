package com.csf.web.repository;

import com.csf.web.entity.NewsImg;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by changqi.wu on 17-10-14.
 */
public interface NewsImgDao extends JpaRepository<NewsImg, Long> {

    @Query("delete from NewsImg where cid = ?1")
    @Modifying
    void deleteNewsImg(Long cid);
}
