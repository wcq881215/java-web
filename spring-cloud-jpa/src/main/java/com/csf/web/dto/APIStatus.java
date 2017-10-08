package com.csf.web.dto;

/**
 * Created by changqi.wu on 17-8-2.
 */
public enum APIStatus {
    success("200", "success"),
    un_check("-1", "用户或密码错误"),
    failure("500", "service unavailable"),
    param_error("400", "参数错误");

    private String code;
    private String msg;

    APIStatus(String code, String msg) {
        this.code = code;
        this.msg = msg;
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
}
