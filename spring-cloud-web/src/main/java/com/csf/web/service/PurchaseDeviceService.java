package com.csf.web.service;

import com.csf.web.entity.PurchaseDevice;
import com.csf.web.repository.PurchaseDeviceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2018/1/7.
 */
@Service
public class PurchaseDeviceService {

    @Autowired
    private PurchaseDeviceDao purchaseDeviceDao;

    public PurchaseDevice save(PurchaseDevice purchaseDevice) {
        return purchaseDeviceDao.save(purchaseDevice);
    }

    public PurchaseDevice findById(Long id) {
        return purchaseDeviceDao.findOne(id);
    }

    public Page<PurchaseDevice> findAll(Integer page,Integer pageSie){
        Sort sort = new Sort(Sort.Direction.DESC,"time");
         Pageable pageable = new PageRequest(page,pageSie,sort);
        return purchaseDeviceDao.findAll(pageable);
    }
}
