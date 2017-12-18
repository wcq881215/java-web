package com.csf.web.repository;

import com.csf.web.entity.Case;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Date;
import java.util.List;

/**
 * Created by changqi.wu on 17-8-1.
 */

public interface CaseDao extends JpaRepository<Case, Long> {


    @Query(value = "from Case c where (c.title like :key or c.content like :key) and c.time >= :start ")
    List<Case> search(@Param("key") String key, @Param("start") Date start, Pageable pageable);

    @Query(value = "select  count(*) from Case c where (c.title like :key or c.content like :key) and c.time >= :start ")
    Long searchNo(@Param("key") String key, @Param("start") Date start);


}
