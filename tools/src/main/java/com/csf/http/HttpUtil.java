package com.csf.http;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * Created by changqi.wu on 2018/2/26.
 */

public class HttpUtil {

    private static String url = "http://54.222.205.14:8003/nlp-service-server/analysis";

    public static String post(String url, Map<String, String> params) {
        DefaultHttpClient httpclient = new DefaultHttpClient();
        String body = null;
        HttpPost post = postForm(url, params);
        body = invoke(httpclient, post);
        httpclient.getConnectionManager().shutdown();
        return body;
    }

    public static String get(String url) {
        DefaultHttpClient httpclient = new DefaultHttpClient();
        String body = null;
        HttpGet get = new HttpGet(url);
        body = invoke(httpclient, get);
        httpclient.getConnectionManager().shutdown();
        return body;
    }

    private static String invoke(DefaultHttpClient httpclient,
                                 HttpUriRequest httpost) {
        HttpResponse response = sendRequest(httpclient, httpost);
        String body = paseResponse(response);
        return body;
    }

    private static String paseResponse(HttpResponse response) {
        HttpEntity entity = response.getEntity();
//		String charset = EntityUtils.getContentCharSet(entity);
        String body = null;
        try {
            body = EntityUtils.toString(entity);
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return body;
    }

    private static HttpResponse sendRequest(DefaultHttpClient httpclient,
                                            HttpUriRequest httpost) {
        HttpResponse response = null;

        try {
            response = httpclient.execute(httpost);
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return response;
    }

    private static HttpPost postForm(String url, Map<String, String> params) {
        HttpPost httpost = new HttpPost(url);
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        Set<String> keySet = params.keySet();
        for (String key : keySet) {
            nvps.add(new BasicNameValuePair(key, params.get(key)));
        }
        try {
            httpost.setEntity(new UrlEncodedFormEntity(nvps, HTTP.UTF_8));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return httpost;
    }

    public static void main(String[] args) {
        StringBuffer url = new StringBuffer();
        url.append("http://192.168.30.134:8003/nlp-service-server/analysis?name=上证&url=www.baidu.com&content=");
        String content = "阿里巴巴集团主办的全球云计算TOP级峰会,汇集DT时代最强大脑,描绘云计算发展趋势和蓝图,展现云计算、大数据、人工智能蓬勃发展的技术。";
        for (int i = 0; i < 10; i++) {
            url.append(content);
        }
        String resp = HttpUtil.get(url.toString());
        System.out.println(resp);

        url = new StringBuffer("http://192.168.30.134:8003/nlp-service-server/analysis");
        Map<String, String> param = new HashMap<>();
        param.put("name", "上证");
        param.put("url", "www.baidu.com");
        param.put("content", "阿里巴巴集团主办的全球云计算TOP级峰会,汇集DT时代最强大脑,描绘云计算发展趋势和蓝图,展现云计算、大数据、人工智能蓬勃发展的技术。");
        resp = HttpUtil.post(url.toString(), param);
        System.out.println(resp);
    }
}
