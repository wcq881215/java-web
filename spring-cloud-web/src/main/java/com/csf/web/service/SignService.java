package com.csf.web.service;

import com.csf.web.entity.Sign;
import com.csf.web.repository.SignDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/12/26.
 */
@Service
public class SignService {

    @Autowired
    private SignDao signDao;

    public void saveSign(Sign sign){
        signDao.save(sign);
    }

}
