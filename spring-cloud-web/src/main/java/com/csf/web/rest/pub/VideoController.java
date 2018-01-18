package com.csf.web.rest.pub;

import com.csf.web.constants.OAConstants;
import com.csf.web.dto.APIStatus;
import com.csf.web.dto.BaseDto;
import com.csf.web.entity.User;
import com.csf.web.entity.Video;
import com.csf.web.entity.VideoSrc;
import com.csf.web.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Map;

/**
 * Created by changqi.wu on 17-10-15.
 */
@Controller
@RequestMapping("/web/video")
public class VideoController extends FileUploadService {

    @Autowired
    private VideoService videoService;

    @RequestMapping("/more")
    public String listDevice() {
        return "/video/more";
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
        return BaseDto.newDto(videoService.findAll(page, pageSize));
    }


    @RequestMapping("/detail/{id}")
    public String detailDevice(@PathVariable("id") Long id) {
        Video video = videoService.findById(id);
        attr("data", video);
        return "/video/detail";
    }

//    public BaseDto saveVideo(HttpServletRequest request) {
//        MultipartHttpServletRequest multRequest = ((MultipartHttpServletRequest) request);
//        List<MultipartFile> files = multRequest.getFiles("file");
//        String title = multRequest.getParameter("title");
//        String content = multRequest.getParameter("content");
//        Video v = new Video();
//        v.setTitle(title);
//        v.setContent(content);
//        v.setState(true);
//        v.setTime(new Date());
//        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
//        v.setUser(user);
//        v = videoService.saveVideo(v);
//        if (!CollectionUtils.isEmpty(files)) {
//            for (MultipartFile f : files) {
//                Map<String, String> map = upload(f, request);
//                VideoSrc vds = new VideoSrc();
//                vds.setAlt(map.get("file"));
//                vds.setPath(map.get("src"));
//                vds.setSrc(map.get("url"));
//                vds.setVid(v.getId());
//                videoService.saveVideoSrc(vds);
//            }
//        }
//        return BaseDto.newDto("");
//    }

    @RequestMapping("/add")
    @ResponseBody
    public BaseDto saveVideo(String title, String content, MultipartFile file, HttpServletRequest request) {
        //upload
        Map<String, String> map = upload(file, request);
        //content
        Video video = new Video();
        video.setContent(content);
        video.setState(true);
        video.setTime(new Date());
        video.setTitle(title);
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        video.setUser(user);
        video = videoService.saveVideo(video);

        //video
        VideoSrc vds = new VideoSrc();
        vds.setAlt(map.get("file"));
        vds.setPath(map.get("src"));
        vds.setSrc(map.get("url"));
        vds.setVid(video.getId());
        vds.setState(true);
        vds.setUpload(new Date());
        videoService.saveVideoSrc(vds);

        return BaseDto.newDto(video.getId());
    }

    @RequestMapping("/update")
    @ResponseBody
    public BaseDto saveVideo(Long id,String title, String content, MultipartFile file, HttpServletRequest request) {
        Video video = videoService.findById(id);
        if(video == null){
            return BaseDto.newDto(APIStatus.param_error);
        }
        //upload
        Map<String, String> map = upload(file, request);
        //content
        video.setContent(content);
        video.setState(true);
        video.setTime(new Date());
        video.setTitle(title);
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        video.setUser(user);
        video = videoService.saveVideo(video);

        //video
        VideoSrc vds = new VideoSrc();
        vds.setAlt(map.get("file"));
        vds.setPath(map.get("src"));
        vds.setSrc(map.get("url"));
        vds.setVid(video.getId());
        vds.setState(true);
        vds.setUpload(new Date());
        videoService.saveVideoSrc(vds);

        return BaseDto.newDto(video.getId());
    }

}
