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
public class SysConfigService {


    @Autowired
    private SysConfigDao sysConfigDao;

    public void saveConfig(SysConfig conf) {
        sysConfigDao.save(conf);
    }


}