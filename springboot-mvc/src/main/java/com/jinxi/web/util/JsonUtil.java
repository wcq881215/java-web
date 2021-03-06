package com.jinxi.web.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.springframework.util.StringUtils;


/**
 * Created by changqi.wu on 2017/4/18.
 */

public class JsonUtil {

    public static final String EMPTY_JSON = "{}";
    public static final String EMPTY_JSON_ARRAY = "[]";

    private static final GsonBuilder builder = new GsonBuilder();

    private static final Gson gson = builder.serializeNulls().serializeSpecialFloatingPointValues().create();

    public static Gson getGson(){
        return gson;
    }

    public static <T> T format(String json, Class<T> clazz) {
        if (StringUtils.isEmpty(json)) {
            return null;
        }
        return gson.fromJson(json, clazz);
    }


    public static String toJson(Object object) {
        if (object == null) {
            return EMPTY_JSON;
        }
        return gson.toJson(object);
    }

}
