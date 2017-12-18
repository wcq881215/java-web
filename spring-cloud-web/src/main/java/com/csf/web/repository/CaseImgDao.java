package com.csf.web.repository;

import com.csf.web.entity.CaseImg;
import com.csf.web.entity.DeviceImg;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by changqi.wu on 17-8-1.
 */

public interface CaseImgDao extends JpaRepository<CaseImg, Long> {


    List<CaseImg> findByCid(String cid);


}
