package com.csf.web.repository;

import com.csf.web.entity.Advice;
import com.csf.web.entity.Attach;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by changqi.wu on 17-10-12.
 */
public interface AttachDao extends JpaRepository<Attach, Long> {

    Page<Attach> findByNameLike(String name, Pageable pageable);

}
