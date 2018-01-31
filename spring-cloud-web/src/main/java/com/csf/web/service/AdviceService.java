package com.csf.web.service;

import com.csf.web.entity.Advice;
import com.csf.web.entity.Device;
import com.csf.web.repository.AdviceDao;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by changqi.wu on 17-10-12.
 */
@Service
@Transactional
public class AdviceService {
    @Autowired
    private AdviceDao adviceDao;

    public Advice addAdvice(Advice advice) {
        return adviceDao.save(advice);
    }

    public List<Advice> findAll(){
        Sort sort = new Sort(Sort.Direction.DESC,"time");
        return adviceDao.findAll(sort);
    }

    public Page<Advice> search(String kword, Pageable pageable) {
        if(StringUtils.isBlank(kword)){
            kword = "";
        }
        kword = "%" + kword + "%";
        return adviceDao.findByContentLike(kword,pageable);
    }

    public void deleteAdvice(Long id) {
        adviceDao.delete(id);
    }
}
