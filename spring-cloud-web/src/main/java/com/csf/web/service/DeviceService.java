package com.csf.web.service;

import com.csf.web.entity.Device;
import com.csf.web.entity.DeviceImg;
import com.csf.web.entity.User;
import com.csf.web.repository.DeviceDao;
import com.csf.web.repository.DeviceImgDao;
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
    @Autowired
    private DeviceImgDao deviceImgDao;

    public Page<Device> findAll(Integer page, Integer pageSize) {
        Sort sort = new Sort(Sort.Direction.DESC, "time");
        Pageable pageable = new PageRequest(page, pageSize, sort);
        return deviceDao.findAll(pageable);
    }

    public List<Device> findAll() {
        return deviceDao.findAll();
    }

    public List<Device> findByNameLike(String name) {
        return deviceDao.findByNameLike(name);
    }


    public Device findById(Long id) {
        return deviceDao.findOne(id);
    }

    public Boolean existDevice(String sn) {
        Device device = deviceDao.findBySn(sn);
        if(device == null){
            return  false;
        }
        return true;
    }


    public Device saveDevice(Device device) {
        return deviceDao.save(device);
    }

    public DeviceImg saveDeviceImg(DeviceImg img) {

        return deviceImgDao.save(img);
    }


}