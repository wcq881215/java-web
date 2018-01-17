package com.csf.web.rest.pub;

import com.csf.web.constants.OAConstants;
import com.csf.web.dto.APIStatus;
import com.csf.web.dto.BaseDto;
import com.csf.web.entity.Attach;
import com.csf.web.entity.AttachImg;
import com.csf.web.entity.Image;
import com.csf.web.entity.User;
import com.csf.web.rest.AttacheService;
import com.csf.web.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by changqi.wu on 17-10-6.
 */
@Controller
@RequestMapping("/web/attach")
public class AttachController extends FileUploadService {

    @Autowired
    private AttacheService attacheService;
    @Autowired
    private UserService userService;

    @RequestMapping("/add")
    @ResponseBody
    public BaseDto addTick(String name, Double price, String product, String _desc) {
        Attach attach = new Attach();
        attach.setTime(new Date());
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        attach.setUser(user);
        attach.setDesc(_desc);
        attach.setName(name);
        attach.setPrice(price);
        attach.setProduct(product);
        attach.setState(true);
        attach = attacheService.save(attach);
        return BaseDto.newDto(attach);
    }

    @RequestMapping("/image")
    @ResponseBody
    public BaseDto uploadImg(String img, Long aid, String type, String alt,
                             HttpServletRequest request) {
        if (aid == null) {
            return BaseDto.newDto(APIStatus.failure);
        }
        if (StringUtils.isBlank(img)) {
            return BaseDto.newDto("");
        }

        //clear old img
        attacheService.deleteAttachImg(aid);

        String imgs[] = img.split("##@##");
        String types[] = type.split("##@##");
        String alts[] = alt.split("##@##");
        for (int i = 0; i < imgs.length; i++) {
            String imag = imgs[i];
            Image image = saveImage(imag, types[i], request);
            AttachImg im = new AttachImg();
            im.setUpload(image.getTime());
            im.setState(true);
            im.setSrc(image.getUrl());
            im.setAid(aid);
            im.setAlt(alts[i]);
            im.setPath(image.getPath());
            attacheService.saveAttachImg(im);
        }

        return BaseDto.newDto("");
    }


    @RequestMapping("/list")
    @ResponseBody
    public BaseDto listAttach(String key ,Integer page, Integer pageSize) {
        if (page == null) {
            page = 0;
        }
        if (pageSize == null) {
            pageSize = 20;
        }
        Sort sort = new Sort(Sort.Direction.DESC, "time");
        Pageable pageable = new PageRequest(page, pageSize, sort);
        Page<Attach> data = attacheService.searchAttach(key,pageable);
        return BaseDto.newDto(data);
    }


    @RequestMapping("/detail/{id}")
    public String detailDevice(@PathVariable("id") Long id) {
        Attach data = attacheService.findById(id);
        attr("data", data);
        return "/attach/detail";
    }

    @RequestMapping("/update")
    @ResponseBody
    public BaseDto updateAttach(Attach attach ) {
        if(attach ==null){
            return BaseDto.newDto(APIStatus.param_error);
        }
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        if(user == null){
            user = userService.findById(1L);
        }
        attach.setUser(user);
        attach = attacheService.save(attach);
        return BaseDto.newDto(attach);
    }


}
