package com.csf.web.service;

import com.csf.web.dto.PageDto;
import com.csf.web.entity.Case;
import com.csf.web.entity.CaseImg;
import com.csf.web.repository.CaseDao;
import com.csf.web.repository.CaseImgDao;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.Date;
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


    public PageDto search(Integer page, Integer pageSize, String key, Date start, String type, String desc) {
        PageDto dto = new PageDto(page,pageSize);
        Integer offset = page * pageSize;
        if (StringUtils.isBlank(key)) {
            key = "";
        }
        key = "%" + key + "%";

        Sort sort = new Sort(Sort.Direction.DESC, desc);
        Pageable pageable = new PageRequest(page, pageSize, sort);

        if(start == null){
            Sort st = new Sort(Sort.Direction.ASC, "time");
            Pageable pb = new PageRequest(0, 1, st);
            Page<Case> datas = caseDao.findAll(pb);
            if(datas !=null && !CollectionUtils.isEmpty(datas.getContent())){
                start = datas.getContent().get(0).getTime();
            }
        }

        Long total = caseDao.searchNo(key, start);
        dto.setTotal(total);
        if (total > 0) {
            List<Case> data = caseDao.search(key, start, pageable);
            dto.setData(data);
        }
        return dto;
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