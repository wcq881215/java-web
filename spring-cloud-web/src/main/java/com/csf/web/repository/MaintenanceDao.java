package com.csf.web.repository;

import com.csf.web.entity.Maintenance;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by changqi.wu on 17-10-5.
 */
public interface MaintenanceDao extends JpaRepository<Maintenance, Long> {

    Page<Maintenance> findByContentLike(String key, Pageable pageable);
}
