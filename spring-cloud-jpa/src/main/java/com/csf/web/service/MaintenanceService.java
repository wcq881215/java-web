package com.csf.web.service;

import com.csf.web.entity.Maintenance;
import com.csf.web.repository.MaintenanceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by changqi.wu on 17-10-5.
 */
@Service
@Transactional
public class MaintenanceService {

    @Autowired
    private MaintenanceDao maintenanceDao;

    public Page<Maintenance> findAll(Integer page, Integer pageSize) {
        Sort sort = new Sort(Sort.Direction.DESC, "time");
        Pageable pageable = new PageRequest(page, pageSize, sort);
        return maintenanceDao.findAll(pageable);
    }


    public Maintenance findById(Long id) {
        return maintenanceDao.findOne(id);
    }


    public void saveDevice(Maintenance maintenance) {
        maintenanceDao.save(maintenance);
    }


}
