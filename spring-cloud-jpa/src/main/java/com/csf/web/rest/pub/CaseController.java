package com.csf.web.rest.pub;

import com.csf.web.constants.OAConstants;
import com.csf.web.dto.APIStatus;
import com.csf.web.dto.BaseDto;
import com.csf.web.entity.*;
import com.csf.web.service.CaseService;
import com.csf.web.util.DateUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by changqi.wu on 17-10-6.
 */
@Controller
@RequestMapping("/web/case")
public class CaseController extends FileUploadService {

    @Autowired
    private CaseService caseService;

    @RequestMapping("/add")
    @ResponseBody
    public BaseDto addTick(HttpServletRequest request, String title, String content) {
        Case _case = new Case();
        _case.setContent(content);
        _case.setTitle(title);
        _case.setState(true);
        _case.setTime(new Date());
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        _case.setUser(user);
        _case = caseService.saveCase(_case);
        return BaseDto.newDto(_case);
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
            CaseImg im = new CaseImg();
            im.setUpload(image.getTime());
            im.setState(true);
            im.setSrc(image.getUrl());
            im.setCid(cid);
            im.setAlt(alts[i]);
            im.setPath(image.getPath());
            caseService.saveCaseImg(im);
        }


        return BaseDto.newDto("");
    }

    @RequestMapping("/list")
    @ResponseBody
    public BaseDto listDevice(Integer page, Integer pageSize, String key, String period, String type, String sort) {
        if (page == null) {
            page = 0;
        }
        if (pageSize == null) {
            pageSize = 20;
        }
        Date start = null;
        if (StringUtils.isNotBlank(period)) {
            if ("week".equals(period)) { //一周
                start = DateUtils.getLastDay(-7);
            } else if ("three".equals(period)) {//三个月
                start = DateUtils.getDateByMongth(-3);
            } else if ("half".equals(period)) {//半年
                start = DateUtils.getDateByMongth(-6);
            } else if ("year".equals(period)) {//一年
                start = DateUtils.getDateByMongth(-12);
            }
        }

        if (StringUtils.isBlank(sort)) {
            sort = "time";
        }

        return BaseDto.newDto(caseService.search(page, pageSize, key, start, type, sort));
    }


    @RequestMapping("/detail/{id}")
    public String detailDevice(@PathVariable("id") Long id) {
        Case _case = caseService.findById(id);
        attr("data", _case);
        return "/technician/detail";
    }

    @RequestMapping("/ssi")
    public BaseDto uploadSSIImg(List<MultipartFile> file, String title, String content,
                                HttpServletRequest request) {
        System.out.println(title + "  -- " + content + "  -- " + file);
        return BaseDto.newDto("xx");
    }

    @RequestMapping("/test")
    public BaseDto uploadImg(MultipartFile file,
                             HttpServletRequest request) {
        String cid = request.getParameter("id");
        if (StringUtils.isBlank(cid)) {
            response.setStatus(500);
            return BaseDto.newDto(APIStatus.failure);
        }
        Long _cid = Long.valueOf(cid);
        Map<String, String> map = upload(file, request);
        if (map == null || map.isEmpty()) {
            response.setStatus(500);
            return BaseDto.newDto(APIStatus.failure);
        }
        String filename = map.get("file");
        String url = map.get("src");
        String src = map.get("url");
        CaseImg img = new CaseImg();
        img.setAlt(filename);
        img.setCid(_cid);
        img.setSrc(src);
        img.setState(true);
        img.setUpload(new Date());
        caseService.saveCaseImg(img);

        return BaseDto.newDto("");
    }


    public BaseDto test(HttpServletRequest request) {

        MultipartHttpServletRequest mutliRequest = (MultipartHttpServletRequest) request;

        String param = mutliRequest.getParameter("");

        Map<String, MultipartFile> files = mutliRequest.getFileMap();//得到文件map对象
        System.out.println(files + "====================");
        String upaloadUrl = "/home/changqi.wu/java/idea-work/apache-tomcat-8.5.15/upload";//得到当前工程路径拼接上文件名
        File dir = new File(upaloadUrl);
        if (!dir.exists())//目录不存在则创建
            dir.mkdirs();
        for (MultipartFile file : files.values()) {
            String fileName = file.getOriginalFilename();//相片的名字
            //根据需求存储自己需要的信息到数据库，我这里是存储相片的名字及它所关联的相册的id
            File tagetFile = new File(upaloadUrl + fileName);//创建文件对象
            if (!tagetFile.exists()) {//文件名不存在 则新建文件，并将文件复制到新建文件中
                try {
                    tagetFile.createNewFile();
                    file.transferTo(tagetFile);//到这里就可以上传了，以下是处理图片及允许gif的上传
                    //图片扩展名
                    String types = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
                    //以1024*768大小改变图片,如果是gif则放开限制，如果需要存储原图则不需要处理

                } catch (IllegalStateException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }
        }


        return BaseDto.newDto("");
    }

}
