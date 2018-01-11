package com.csf.web.repository;

import com.csf.web.entity.Message;
import com.csf.web.entity.MessageReader;
import com.csf.web.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * Created by changqi.wu on 18-1-11.
 */
public interface MessageReaderDao extends JpaRepository<MessageReader, Long> {

    @Query("select count (1) from MessageReader where user = :user")
    Long getUserReadMsgNo(@Param("user") User user);

    @Query(" from MessageReader where user = :user and message= :message")
    MessageReader findByUserAndMessage(@Param("user")User user, @Param("message")Message message);
}
