package com.csf.web.repository;

import com.csf.web.entity.Device;
import com.csf.web.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by changqi.wu on 17-8-1.
 */

public interface DeviceDao extends JpaRepository<Device, Long> {


    Device findByName(String name);

    List<Device> findByNameLike(String name);

    Device findBySn(String sn);

}
