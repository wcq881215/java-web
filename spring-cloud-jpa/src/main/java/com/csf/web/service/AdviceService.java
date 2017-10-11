package com.csf.web.service;

import com.csf.web.entity.Advice;
import com.csf.web.repository.AdviceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by changqi.wu on 17-10-12.
 */
@Service
public class AdviceService {
    @Autowired
    private AdviceDao adviceDao;

    public Advice addAdvice(Advice advice) {
        return adviceDao.save(advice);
    }
}
