package com.csf.web.repository;

import com.csf.web.entity.Case;
import com.csf.web.entity.Device;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by changqi.wu on 17-8-1.
 */

public interface CaseDao extends JpaRepository<Case, Long> {


}
