package com.csf.web.service;

/**
 * Created by Administrator on 2017/12/24.
 */

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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public class HttpClientUtils {

    public static void main(String[] args) throws Exception {
        String url = "http://api.t.sina.com.cn/short_url/shorten.json?source=2265342614&url_long=http%3A%2F%2Fdev.datawatch.chinascope.net%2Ftemplates%2Findex%2Fsearch.html%3Fid%3D26";
        System.out.println(httpGet(url));
    }

    public static String httpGet(String url) throws IOException {
        URL u = new URL(url);
        HttpURLConnection connection = (HttpURLConnection) u.openConnection();
        connection.setRequestMethod("GET");
        connection.connect();
        InputStream in = connection.getInputStream();
        BufferedInputStream bis = new BufferedInputStream(in);
        byte[] b = new byte[bis.available()];
        bis.read(b);
        bis.close();
        in.close();
        connection.disconnect();
        String resp = new String(b);
        // System.out.println(resp);
        return resp;
    }

    private static List<NameValuePair> constructParamList(Map<String, String> paramsMap) {
        List<NameValuePair> paramsList = new ArrayList<NameValuePair>();
        for (String key : paramsMap.keySet()) {
            paramsList.add(new BasicNameValuePair(key, paramsMap.get(key)));
        }
        return paramsList;
    }

    public static String doPost(String url, Map<String, String> paramsMap) {
        HttpPost httppost = null;
        String result = null;

        try {
            httppost = new HttpPost(url);
            System.out.println("request param:" + paramsMap.toString());
            List<NameValuePair> paramsList = constructParamList(paramsMap);
            httppost.setEntity(new UrlEncodedFormEntity(paramsList, charset));

            HttpClient httpClient = HttpClientBuilder.create().build();

            HttpResponse response = httpClient.execute(httppost);

            BufferedReader br = new BufferedReader(new InputStreamReader((response.getEntity().getContent()), "utf-8"));
            StringBuilder s = new StringBuilder();
            while ((result = br.readLine()) != null) {
                s = s.append(result);
            }
            result = s.toString();
            br.close();

        } catch (Exception e) {

            e.printStackTrace();
        }
        return result;
    }

    private static final String charset = "UTF-8";

}
