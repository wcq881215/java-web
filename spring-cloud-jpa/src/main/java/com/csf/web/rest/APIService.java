package com.csf.web.rest;

import com.csf.web.JsonUtils;
import com.csf.web.dto.APIStatus;
import com.csf.web.dto.BaseDto;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by changqi.wu on 17-8-27.
 */
public class APIService {

    @Autowired
    protected HttpServletRequest request;

    @Autowired
    protected HttpServletResponse response;


    public String failure(Object obj) {
        BaseDto dto = BaseDto.newDto(APIStatus.failure);
        dto.setObj(obj);
        return JsonUtils.toJson(dto);
    }

    public String failure() {
        BaseDto dto = BaseDto.newDto(APIStatus.failure);
        return JsonUtils.toJson(dto);
    }

    public String failure(String code,String message) {
        BaseDto dto =new  BaseDto();
        dto.setCode(code);
        dto.setMsg(message);
        return JsonUtils.toJson(dto);
    }

    public String success(Object obj){
        BaseDto dto = BaseDto.newDto(obj);
        return JsonUtils.toJson(dto);
    }
}
