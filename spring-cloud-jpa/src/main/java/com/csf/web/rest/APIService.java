package com.csf.web.rest;

import com.csf.web.dto.APIStatus;
import com.csf.web.dto.BaseDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by changqi.wu on 17-8-27.
 */
public class APIService {

    @Autowired
    protected HttpServletRequest request;

    @Autowired
    protected HttpServletResponse response;


    /*****ajax response body ****/
    public BaseDto failure(Object obj) {
        BaseDto dto = BaseDto.newDto(APIStatus.failure);
        dto.setObj(obj);
        return dto;
    }

    public BaseDto ajaxResp(APIStatus status) {
        return BaseDto.newDto(status);
    }

    public static BaseDto ajaxFailure() {
        return BaseDto.newDto(APIStatus.failure);
    }

    public BaseDto ajaxFailure(String code, String message) {
        BaseDto dto = new BaseDto();
        dto.setCode(code);
        dto.setMsg(message);
        return dto;
    }

    public BaseDto ajaxSuccess(Object obj) {
        BaseDto dto = BaseDto.newDto(obj);
        return dto;
    }

    /*****ajax response body end****/

    /*****request  ****/
    public String webFailure(String code, String message) {
        request.setAttribute("code", code);
        request.setAttribute("message", message);
        return error_page;
    }

    public String webResp(APIStatus status) {
        request.setAttribute("code", status.getCode());
        request.setAttribute("message", status.getMsg());
        return error_page;
    }

    public void attr(String key, Object value) {
        request.setAttribute(key, value);
    }

    public void page(Page value) {
        request.setAttribute("page", value);
    }

    public void list(Page value) {
        List val = null;
        if (value != null) {
            val = value.getContent();
        }
        request.setAttribute("dataList", val);
    }

    public void list(List value) {
        request.setAttribute("dataList", value);
    }


    /*****request  ****/


    public static final String error_page = "/error";

}
