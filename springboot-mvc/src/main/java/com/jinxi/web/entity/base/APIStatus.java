package com.jinxi.web.entity.base;

/**
 * Created by changqi.wu on 17-8-2.
 */
public enum APIStatus {
    success("200", "success"),
    failure("500", "service unavailable");

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
