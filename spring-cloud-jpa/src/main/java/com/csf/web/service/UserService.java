package com.csf.web.service;

import com.csf.web.entity.SysConfig;
import com.csf.web.entity.User;
import com.csf.web.repository.SysConfigDao;
import com.csf.web.repository.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by changqi.wu on 2017/8/8.
 */

@Service
@Transactional
public class UserService {

    @Autowired
    private UserDao userDao;
    @Autowired
    private SysConfigDao sysConfigDao;


    public List<User> findAll() {
        return userDao.findAll();
    }

    public List<User> findByName(String name,String pasword)
    {
        List<User> userList1 = userDao.findByUsername(name);
        User userList2 = userDao.findByUsernameAndPassword(name,pasword);
        System.out.println("userList1:" + userList1);
        System.out.println("userList2:" + userList2);
        return userList1;
    }

    public void saveUser(SysConfig conf)
    {
        sysConfigDao.save(conf);
    }


}