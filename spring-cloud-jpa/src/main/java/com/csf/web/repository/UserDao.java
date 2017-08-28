package com.csf.web.repository;

import com.csf.web.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by changqi.wu on 17-8-1.
 */

public interface UserDao extends JpaRepository<User, Long> {


    @Query(value = "select * from app_user u where u.username=?1 and u.password=?2", nativeQuery = true)
    User findByUsernameAndPassword(String username,String password);

    User findByUsername(String username);

}
