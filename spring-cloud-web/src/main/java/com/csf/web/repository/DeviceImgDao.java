package com.csf.web.repository;

import com.csf.web.entity.Device;
import com.csf.web.entity.DeviceImg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by changqi.wu on 17-8-1.
 */

public interface DeviceImgDao extends JpaRepository<DeviceImg, Long> {


    List<DeviceImg> findByDid(String did);


    @Query("delete  from DeviceImg where did = ?1")
    @Modifying
    void deleteByDevice(Long did);
}
