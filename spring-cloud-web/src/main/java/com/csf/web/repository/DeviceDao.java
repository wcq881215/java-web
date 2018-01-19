package com.csf.web.repository;

import com.csf.web.entity.Device;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by changqi.wu on 17-8-1.
 */

public interface DeviceDao extends JpaRepository<Device, Long> {


    Device findByName(String name);

    List<Device> findByNameLike(String name);

    Page<Device> findByNameLike(String name, Pageable pageable);

    Device findBySn(String sn);

}
