package com.csf.web.service;

import com.csf.web.entity.User;
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
public class DeviceService {

    @Autowired
    private UserDao userDao;

    //test
    public List<User> findAll() {
        return userDao.findAll();
    }

    public User findByName(String name) {
        return userDao.findByUsername(name);
    }

    public User login(String name, String pasword) {
        return userDao.findByUsernameAndPassword(name, pasword);
    }

    public void saveUser(User user) {
        userDao.save(user);
    }


}