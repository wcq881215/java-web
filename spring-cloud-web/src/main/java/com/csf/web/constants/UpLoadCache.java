package com.csf.web.constants;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;

import java.util.Date;
import java.util.concurrent.TimeUnit;

/**
 * Created by changqi.wu on 17-10-6.
 */
public class UpLoadCache {


    private static Cache<String, UploadFile> cache = CacheBuilder.newBuilder().expireAfterAccess(1, TimeUnit.HOURS).build();


    public static void put(String key, String url) {
        UploadFile file = new UploadFile();
        file.setFileName(key);
        file.setUrl(url);
        file.setTime(new Date());
        cache.put(key, file);
    }

    public static UploadFile get(String key) {

        return cache.getIfPresent(key);
    }
}
