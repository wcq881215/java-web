package com.csf.web.service;

import com.csf.web.entity.Case;
import com.csf.web.entity.CaseImg;
import com.csf.web.entity.Device;
import com.csf.web.repository.CaseDao;
import com.csf.web.repository.CaseImgDao;
import com.csf.web.repository.DeviceDao;
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
public class CaseService {

    @Autowired
    private CaseDao caseDao;

    @Autowired
    private CaseImgDao caseImgDao;

    public Page<Case> findAll(Integer page, Integer pageSize) {
        Sort sort = new Sort(Sort.Direction.DESC, "time");
        Pageable pageable = new PageRequest(page, pageSize, sort);
        return caseDao.findAll(pageable);
    }


    public Case findById(Long id) {
        return caseDao.findOne(id);
    }


    public Case saveCase(Case _case) {
        return caseDao.save(_case);
    }

    public void saveCaseImg(CaseImg img) {
        caseImgDao.save(img);
    }
}