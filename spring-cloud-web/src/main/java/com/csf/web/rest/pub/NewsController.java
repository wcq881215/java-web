package com.csf.web.rest.pub;

import com.csf.web.constants.OAConstants;
import com.csf.web.dto.APIStatus;
import com.csf.web.dto.BaseDto;
import com.csf.web.entity.*;
import com.csf.web.rest.APIService;
import com.csf.web.service.NewsService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by changqi.wu on 17-10-13.
 */
@Controller
@RequestMapping("/web/news")
public class NewsController extends FileUploadService {

    @Autowired
    private NewsService newsService;

    @RequestMapping("/add")
    @ResponseBody
    public BaseDto addTick(HttpServletRequest request, String title, String content) {
        News news = new News();
        news.setContent(content);
        news.setTitle(title);
        news.setState(true);
        news.setTime(new Date());
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        news.setUser(user);
        news = newsService.saveNews(news);
        return BaseDto.newDto(news);
    }

    @RequestMapping("/image")
    @ResponseBody
    public BaseDto uploadImg(String img, Long cid, String type, String alt,
                             HttpServletRequest request) {
        if (cid == null) {
            return BaseDto.newDto(APIStatus.failure);
        }
        if (StringUtils.isBlank(img)) {
            return BaseDto.newDto("");
        }
        String imgs[] = img.split("##@##");
        String types[] = type.split("##@##");
        String alts[] = alt.split("##@##");
        for (int i = 0; i < imgs.length; i++) {
            String imag = imgs[i];
            Image image = saveImage(imag, types[i], request);
            NewsImg im = new NewsImg();
            im.setUpload(image.getTime());
            im.setState(true);
            im.setSrc(image.getUrl());
            im.setCid(cid);
            im.setAlt(alts[i]);
            im.setPath(image.getPath());
            newsService.saveNewsImg(im);
        }
        return BaseDto.newDto("");
    }

    @RequestMapping("/more")
    public String listDevice() {
        return "news/more";
    }

    @RequestMapping("/list")
    @ResponseBody
    public BaseDto listDevice(Integer page, Integer pageSize) {
        if (page == null) {
            page = 0;
        }
        if (pageSize == null) {
            pageSize = 20;
        }
        return BaseDto.newDto(newsService.findAll(page, pageSize));
    }


    @RequestMapping("/detail/{id}")
    public String detailDevice(@PathVariable("id") Long id) {
        News news = newsService.findById(id);
        attr("data", news);
        return "/news/detail";
    }


}
