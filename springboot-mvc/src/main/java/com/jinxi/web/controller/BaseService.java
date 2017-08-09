package com.jinxi.web.controller;

import com.jinxi.web.entity.base.APIStatus;
import com.jinxi.web.entity.base.BaseDto;
import com.jinxi.web.util.JsonUtil;

/**
 * Created by changqi.wu on 17-8-1.
 */
public class BaseService {

    public String success(Object obj) {
        return JsonUtil.toJson(BaseDto.newDto(obj));
    }

    public String failure(Object obj) {
        BaseDto dto = BaseDto.newDto(APIStatus.failure);
        dto.setObj(obj);
        return JsonUtil.toJson(dto);
    }

}
