package com.csf.web.repository;

import com.csf.web.entity.Device;
import com.csf.web.entity.DeviceImg;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by changqi.wu on 17-8-1.
 */

public interface DeviceImgDao extends JpaRepository<DeviceImg, Long> {


    List<DeviceImg> findByDid(String did);


}
