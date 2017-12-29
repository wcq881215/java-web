package com.csf.web.rest.pub;

import com.csf.web.constants.OAConstants;
import com.csf.web.dto.APIStatus;
import com.csf.web.dto.BaseDto;
import com.csf.web.entity.Case;
import com.csf.web.entity.CaseImg;
import com.csf.web.entity.Image;
import com.csf.web.entity.User;
import com.csf.web.rest.APIService;
import com.csf.web.rest.AttacheService;
import com.csf.web.service.CaseService;
import com.csf.web.service.SignService;
import com.csf.web.util.DateUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
@RequestMapping("/web/attach")
public class AttachController extends APIService {

    @Autowired
    private AttacheService attacheService;

    @RequestMapping("/add")
    @ResponseBody
    public BaseDto addTick( String title, String content) {

        return BaseDto.newDto("");
    }

    @RequestMapping("/update")
    @ResponseBody
    public BaseDto uploadImg(String img, Long cid, String type, String alt,
                             HttpServletRequest request) {



        return BaseDto.newDto("");
    }

    @RequestMapping("/list")
    @ResponseBody
    public BaseDto listDevice(Integer page, Integer pageSize, String key, String period, String type, String sort) {


        return BaseDto.newDto("");
    }


    @RequestMapping("/detail/{id}")
    public String detailDevice(@PathVariable("id") Long id) {

        attr("data", "");
        return "/technician/detail";
    }



}
