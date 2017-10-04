package com.csf.web.service;

import com.csf.web.entity.Device;
import com.csf.web.entity.User;
import com.csf.web.repository.DeviceDao;
import com.csf.web.repository.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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
    private DeviceDao deviceDao;

    public Page<Device> findAll(Integer page, Integer pageSize) {
        Sort sort = new Sort(Sort.Direction.DESC, "time");
        Pageable pageable = new PageRequest(page, pageSize, sort);
        return deviceDao.findAll(pageable);
    }

    public List<Device> findByNameLike(String name) {
        return deviceDao.findByNameLike(name);
    }


    public Device findById(Long id) {
        return deviceDao.findOne(id);
    }


    public void saveDevice(Device device) {
        deviceDao.save(device);
    }


}