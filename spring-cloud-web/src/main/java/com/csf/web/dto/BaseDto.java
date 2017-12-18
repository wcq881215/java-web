package com.csf.web.dto;

import java.io.Serializable;

/**
 * Created by changqi.wu on 17-8-1.
 */
public class BaseDto implements Serializable {

    private String code;
    private String msg;
    private Object obj;


    public static BaseDto newDto(Object obj) {
        return new BaseDto(obj);
    }

    public static BaseDto newDto(APIStatus status) {
        return new BaseDto(status);
    }

    public static BaseDto failure(String message) {
        BaseDto dto = new BaseDto(APIStatus.failure);
        dto.setMsg(message);
        return dto;
    }

    public BaseDto() {
    }

    public BaseDto(APIStatus status) {
        this.code = status.getCode();
        this.msg = status.getMsg();
    }

    private BaseDto(Object obj) {
        this.code = APIStatus.success.getCode();
        this.msg = APIStatus.success.getMsg();
        this.obj = obj;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getObj() {
        return obj;
    }

    public void setObj(Object obj) {
        this.obj = obj;
    }
}
