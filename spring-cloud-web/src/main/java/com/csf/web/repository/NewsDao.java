package com.csf.web.repository;

import com.csf.web.entity.News;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by changqi.wu on 17-10-14.
 */
public interface NewsDao extends JpaRepository<News, Long> {
    Page<News> findBycontentLike(String name, Pageable pageable);
}
