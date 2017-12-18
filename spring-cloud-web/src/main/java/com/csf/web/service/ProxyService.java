package com.csf.web.service;

import com.csf.web.entity.Proxy;
import com.csf.web.repository.ProxyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by changqi.wu on 17-10-17.
 */
@Service
@Transactional
public class ProxyService {

    @Autowired
    private ProxyDao proxyDao;

    public Proxy addProxy(Proxy proxy) {
        return proxyDao.save(proxy);
    }

    public List<Proxy> findAll() {
        return proxyDao.findAll();
    }

    public Proxy findOne(Long id) {
        return proxyDao.findOne(id);
    }
}
