package com.csf.web.service;

import com.csf.web.entity.Attach;
import com.csf.web.entity.News;
import com.csf.web.entity.NewsImg;
import com.csf.web.repository.NewsDao;
import com.csf.web.repository.NewsImgDao;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by changqi.wu on 17-10-14.
 */
@Service
@Transactional
public class NewsService {

    @Autowired
    private NewsDao newsDao;

    @Autowired
    private NewsImgDao newsImgDao;


    public News saveNews(News news) {
        return newsDao.save(news);
    }

    public NewsImg saveNewsImg(NewsImg img) {
        return newsImgDao.save(img);
    }

    public Page<News> findAll(Integer page, Integer pageSize) {
        Sort sort = new Sort(Sort.Direction.DESC, "time");
        Pageable pageable = new PageRequest(page, pageSize, sort);
        return newsDao.findAll(pageable);
    }

    public News findById(Long id) {
        return newsDao.findOne(id);
    }

    public Page<News> searchNews(String name, Pageable pageable) {
        Sort sort = new Sort(Sort.Direction.DESC, "time");

        if(StringUtils.isBlank(name)){
            name = "";
        }
        name = "%" + name + "%";

        return newsDao.findBycontentLike(name,pageable);
    }
}
