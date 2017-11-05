package com.csf.web.repository;

import com.csf.web.entity.Message;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by changqi.wu on 17-10-5.
 */
public interface MessageDao extends JpaRepository<Message, Long> {

    @Query("from Message u where (u.dept is null or  u.dept =:dept) AND (u.team IS NULL or u.team = :team) AND  (u.uid IS NULL or u.uid = :uid ) ")
    List<Message> findUserMessage(@Param("dept") String dept,@Param("team") String team,@Param("uid") Long uid,Pageable pageable);


    @Query("select  count(*) from Message u where (u.dept is null or  u.dept =:dept) AND (u.team IS NULL or u.team = :team) AND  (u.uid IS NULL or u.uid = :uid ) ")
    Long findUserMessageNo(@Param("dept") String dept,@Param("team") String team,@Param("uid") Long uid);
}
