package com.csf.web.repository;

import com.csf.web.entity.Device;
import com.csf.web.entity.Location;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * Created by changqi.wu on 17-8-1.
 */

public interface LocationDao extends JpaRepository<Location, Long> {

    @Query("from Location u where u.mid = :mid order by time desc")
    Location findOneByMid(@Param("mid") String mid);

}
