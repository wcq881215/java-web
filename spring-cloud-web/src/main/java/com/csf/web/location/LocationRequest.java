package com.csf.web.location;

import com.csf.web.util.JsonUtils;
import org.apache.commons.lang3.StringUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/12/24.
 */
public class LocationRequest {

    private static final String ak = "AUXBZ-5C7KP-QK5DJ-L363V-P2L3O-SSFUN";
    private static final String url = "http://apis.map.qq.com/ws/geocoder/v1/";

    public static String getAddress(Double lat,Double lan){
        Map<String ,Object> param = new HashMap<String ,Object>();
        param.put("key",ak);
        param.put("get_poi",0);
        param.put("location",lat+","+lan);

        String json =    HttpUtils.httpGet(url,param);
        if(StringUtils.isNotBlank(json)){
            LocationLBSDto dto = JsonUtils.format(json,LocationLBSDto.class);
            if(dto != null && dto.getStatus() != null && dto.getStatus() == 0){
                System.out.println("find address " +dto.getResult().getAddress());
                return  dto.getResult().getAddress();
            }
        }
        return null;
    }

}
