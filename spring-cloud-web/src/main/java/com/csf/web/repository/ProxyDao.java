package com.csf.web.repository;

import com.csf.web.entity.Proxy;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by changqi.wu on 17-10-17.
 */
public interface ProxyDao extends JpaRepository<Proxy, Long> {
    Page<Proxy> findByPnameLike(String pname, Pageable pageable);
}
