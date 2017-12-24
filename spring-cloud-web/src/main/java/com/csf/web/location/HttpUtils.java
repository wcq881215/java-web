package com.csf.web.location;

/**
 * Created by Administrator on 2017/12/24.
 */

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;


public class HttpUtils {

    public static void main(String[] args) throws Exception {
        String url = "";
        System.out.println(httpGet(url));
    }

    public static String httpGet(String url) throws IOException {
        URL u = new URL(url);
        HttpURLConnection connection = (HttpURLConnection) u.openConnection();
        connection.setRequestMethod("GET");
        connection.connect();

        InputStream in = null;
        String resp = null;
        // 得到响应码
        int res = connection.getResponseCode();
        if (res == 200) {
            in = connection.getInputStream();
            int ch;
            StringBuilder sb2 = new StringBuilder();
            while ((ch = in.read()) != -1) {
                sb2.append((char) ch);
            }
            resp = new String(sb2.toString().getBytes("iso-8859-1"),charset);
            System.out.println("response : " + resp);
        }
        connection.disconnect();

        return resp;
    }

    public static String httpGet(String url, Map<String, Object> paramsMap) {
        if (StringUtils.isBlank(url)) {
            System.err.println("url is null");
            return null;
        }
        StringBuilder sb = constructParamList(paramsMap);
        if (!url.endsWith("?")) {
            url = url + "?";
        }
        sb.insert(0, url);
        System.out.println("request url is " + sb.toString());
        try {
            return httpGet(sb.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    private static StringBuilder constructParamList(Map<String, Object> paramsMap) {
        StringBuilder sb = new StringBuilder();
        for (String key : paramsMap.keySet()) {
            sb.append(key).append("=");
            Object val = paramsMap.get(key);
            if (Objects.equals(val, null)) {
                continue;
            }
            try {
                sb.append(URLEncoder.encode(val.toString(), charset)).append("&");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }

        }
        return sb;
    }


    private static final String charset = "UTF-8";

}
