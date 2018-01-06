package com.csf.web.rest;

import com.csf.web.entity.Attach;
import com.csf.web.entity.AttachImg;
import com.csf.web.repository.AttachDao;
import com.csf.web.repository.AttachImgDao;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/12/26.
 */
@Service
public class AttacheService {

    @Autowired
    private AttachDao attachDao;

    @Autowired
    private AttachImgDao attachImgDao;

    public Attach save(Attach attach) {
        return attachDao.save(attach);
    }

    public void saveAttachImg(AttachImg image) {
        attachImgDao.save(image);
    }

    public Page<Attach> findAttach(Pageable pageable) {
        return attachDao.findAll(pageable);
    }

    public Page<Attach> searchAttach(String name ,Pageable pageable) {
        if(StringUtils.isBlank(name)){
            name = "";
        }
        name = "%" + name + "%";

        return attachDao.findByNameLike(name,pageable);
    }

    public Attach findById(Long id) {
        return attachDao.findOne(id);
    }
}
