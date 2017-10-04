package com.csf.web.repository;

import com.csf.web.entity.Maintenance;
import com.csf.web.entity.Message;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by changqi.wu on 17-10-5.
 */
public interface MessageDao extends JpaRepository<Message, Long> {
}
