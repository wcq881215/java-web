package com.csf.web.service;

import com.csf.web.entity.SysConfig;
import com.csf.web.entity.User;
import com.csf.web.repository.MessageDao;
import com.csf.web.repository.MessageReaderDao;
import com.csf.web.repository.SysConfigDao;
import com.csf.web.repository.UserDao;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.jdbc.core.JdbcTemplate;
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
    private MessageDao messageDao;

    @Autowired
    private MessageReaderDao messageReaderDao;

    public List<User> findAll() {
        return userDao.findAll();
    }

    public Page<User> findAll(Integer page, Integer pageSize) {
        Sort sort = new Sort(Sort.Direction.DESC, "s_time");
        Pageable pageable = new PageRequest(page, pageSize, sort);
        return userDao.findAll(pageable);
    }

    public Long getMessageNo(User user) {
        Long total = messageDao.findUserMessageNo(user.getDept(), user.getTeam(), user.getId());
        Long look = messageReaderDao.getUserReadMsgNo(user);
        return total - look;
    }

    public Page<User> findUser(String name, String mobile, String area, Integer page, Integer pageSize) {
        Sort sort = new Sort(Sort.Direction.DESC, "s_time");
        Pageable pageable = new PageRequest(page, pageSize, sort);
        if (StringUtils.isBlank(mobile)) {
            mobile = "";
        }
        mobile = "%" + mobile + "%";

        if (StringUtils.isBlank(name)) {
            name = "";
        }
        name = "%" + name + "%";

        if (StringUtils.isBlank(area)) {
            area = "";
        }
        area = "%" + area + "%";
        return userDao.findUser(mobile, name, area, pageable);
    }

    public Page<User> findAllInner(String key, String type, Integer page, Integer pageSize) {
        Pageable pageable = new PageRequest(page, pageSize);
        if (StringUtils.isBlank(key)) {
            key = "";
        }
        key = "%" + key + "%";
        if (StringUtils.isNotBlank(type)) {
            return userDao.findInnerTypeUser(key, type, pageable);
        }
        return userDao.findInnerUser(key, pageable);
    }

    public Page<User> findAllInner(String key, Integer page, Integer pageSize) {
        Pageable pageable = new PageRequest(page, pageSize);
        if (StringUtils.isBlank(key)) {
            key = "";
        }
        key = "%" + key + "%";
        return userDao.findServerUser(key, pageable);
    }

    public User findByName(String name) {
        return userDao.findByUsername(name);
    }

    public List<User> findByRole(String name) {
        return userDao.findByRole(name);
    }

    public User findById(Long id) {
        return userDao.findOne(id);
    }

    public User login(String name, String pasword) {
        return userDao.findByUsernameAndPassword(name, pasword);
    }

    public User saveUser(User user) {
        return userDao.save(user);
    }


    public void delete(Long id) {
        userDao.delete(id);
    }
}