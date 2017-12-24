package com.csf.web.location;

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

        return   HttpUtils.httpGet(url,param);
    }

    public static void main(String[] args) {
        getAddress(31.19817833333333,121.62592166666667);
    }
}
