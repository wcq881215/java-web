package com.csf.web.repository;

import com.csf.web.entity.SysConfig;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

/**
 * Created by changqi.wu on 17-8-1.
 */

public interface SysConfigDao extends CrudRepository<SysConfig,Long> {


    @Query("from SysConfig u where u._key=:key")
    SysConfig findCfg(@Param("key") String key);

}
