package com.csf.web.repository;

import com.csf.web.entity.Video;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by changqi.wu on 17-10-15.
 */
public interface VideoDao extends JpaRepository<Video, Long> {

    Page<Video> findByTitleLikeAndContentLike(String title, String content, Pageable pageable);
}
