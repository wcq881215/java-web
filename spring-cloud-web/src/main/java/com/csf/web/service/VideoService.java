package com.csf.web.service;

import com.csf.web.entity.Case;
import com.csf.web.entity.Video;
import com.csf.web.entity.VideoSrc;
import com.csf.web.repository.VideoDao;
import com.csf.web.repository.VideoSrcDao;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by changqi.wu on 17-10-15.
 */
@Service
@Transactional
public class VideoService {

    @Autowired
    private VideoDao videoDao;

    @Autowired
    private VideoSrcDao videoSrcDao;


    public Video saveVideo(Video video) {
        return videoDao.save(video);
    }

    public VideoSrc saveVideoSrc(VideoSrc vsrc) {

        return videoSrcDao.save(vsrc);
    }

    public Page<Video> findAll(Integer page, Integer pageSize) {
        Sort sort = new Sort(Sort.Direction.DESC, "time");
        Pageable pageable = new PageRequest(page, pageSize, sort);
        return videoDao.findAll(pageable);
    }

    public Video findById(Long id) {
        return videoDao.findOne(id);
    }


    public Page<Video> search(String key, Pageable pageable) {
        if(StringUtils.isBlank(key)){
            key = "";
        }
        key = "%"+ key+ "%";
        return videoDao.findByTitleLikeAndContentLike(key,key,pageable);
    }
}
