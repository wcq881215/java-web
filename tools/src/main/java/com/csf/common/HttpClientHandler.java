package com.csf.common;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.URL;
import java.util.*;

/**
 * 提供Http Client访问http接口的方法
 * <p>
 * Created by bob.huang on 2017年12月28日
 */
public class HttpClientHandler {

    /**
     * 使用Get方式访问指定的Url
     *
     * @param path
     * @param params
     * @param access_key
     * @param secret_key
     * @return
     */
    public static String executeRequestWithGet(String path, Map<String, Object> params,
                                               String access_key, String secret_key) {

        int default_timeout = 1000 * 10; // 默认请求超时, 10s
        String result = null;
        HttpClient httpClient = null;
        HttpGet httpget = null;
        try {
            URL url = new URL(generatePath(path, params));
            URI uri = new URI(url.getProtocol(), null, url.getHost(), url.getPort(), url.getPath(),
                    url.getQuery(), null);
            httpget = new HttpGet(uri);
            httpget.addHeader("accept", "application/json");
            httpget.setHeader("access_key", access_key);

            long t = System.currentTimeMillis() / 1000;
            httpget.setHeader("t", String.valueOf(t));
            httpget.setHeader("token", generateToken(access_key, secret_key, t));

            httpClient = getPooledHttpClient(default_timeout);

            HttpResponse response = httpClient.execute(httpget);
            BufferedReader br = new BufferedReader(
                    new InputStreamReader((response.getEntity().getContent()), "UTF-8"));
            StringBuilder s = new StringBuilder();
            while ((result = br.readLine()) != null) {
                s = s.append(result);
            }
            result = s.toString();
            br.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (httpget != null) {
                httpget.abort();
            }
        }

        return result;
    }

    public static String executeRequestWithGet(String path, Map<String, Object> params) {
        int default_timeout = 1000 * 10; // 默认请求超时, 10s
        String result = null;
        HttpClient httpClient = null;
        HttpGet httpget = null;
        try {
            URL url = new URL(generatePath(path, params));
            URI uri = new URI(url.getProtocol(), null, url.getHost(), url.getPort(), url.getPath(), url.getQuery(), null);
            httpget = new HttpGet(uri);
            long t = System.currentTimeMillis() / 1000;
            httpClient = getPooledHttpClient(default_timeout);
            HttpResponse response = httpClient.execute(httpget);
            BufferedReader br = new BufferedReader(new InputStreamReader((response.getEntity().getContent()), "UTF-8"));
            StringBuilder s = new StringBuilder();
            while ((result = br.readLine()) != null) {
                s = s.append(result);
            }
            result = s.toString();
            br.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (httpget != null) {
                httpget.abort();
            }
        }

        return result;
    }

    public static String executeRequestWithPost(String path, Map<String, Object> params) {
        int default_timeout = 1000 * 20; // 默认请求超时, 20s
        return executeRequestWithPost(path, params,default_timeout);

    }

    public static String executeRequestWithPost(String path, Map<String, Object> params, int default_timeout) {


        String result = null;
        HttpClient httpClient = null;
        HttpPost httpPost = null;
        try {
            URL url = new URL(path);
            URI uri = new URI(url.getProtocol(), null, url.getHost(), url.getPort(), url.getPath(),
                    url.getQuery(), null);
            httpPost = new HttpPost(uri);
            //设置参数
            List<NameValuePair> list = new ArrayList<NameValuePair>();
            Iterator iterator = params.entrySet().iterator();
            while (iterator.hasNext()) {
                Map.Entry<String, Object> elem = (Map.Entry<String, Object>) iterator.next();
                Object v = elem.getValue();
                list.add(new BasicNameValuePair(elem.getKey(), Objects.nonNull(v) ? v.toString() : null));
            }
            if (list.size() > 0) {
                UrlEncodedFormEntity entity = new UrlEncodedFormEntity(list, "UTF-8");
                httpPost.setEntity(entity);
            }
            long t = System.currentTimeMillis() / 1000;

            httpClient = getPooledHttpClient(default_timeout);

            HttpResponse response = httpClient.execute(httpPost);
            BufferedReader br = new BufferedReader(
                    new InputStreamReader((response.getEntity().getContent()), "UTF-8"));
            StringBuilder s = new StringBuilder();
            while ((result = br.readLine()) != null) {
                s = s.append(result);
            }
            result = s.toString();
            br.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (httpPost != null) {
                httpPost.abort();
            }
        }

        return result;
    }

    /**
     * generate path, eg: http://api.ichinascope.com/api/stock/search?key=6
     *
     * @param url
     * @param params
     */
    private static String generatePath(String url, Map<String, Object> params) {
        StringBuilder sbuilder = new StringBuilder(url).append("?");
        for (Map.Entry<String, Object> entry : params.entrySet()) {
            sbuilder.append(entry.getKey()).append("=");
            if (entry.getValue() != null) {
                sbuilder.append(entry.getValue());
            }
            sbuilder.append("&");
        }

        return sbuilder.substring(0, sbuilder.length() - 1).toString();
    }

    /**
     * generate token
     *
     * @param access_key
     * @param secret_key
     * @param t          timestamp
     */
    private static String generateToken(String access_key, String secret_key, long t) {
        String token = null;
        try {
            String data = access_key + "," + t + "," + secret_key;
            SecretKeySpec keySpec = new SecretKeySpec(data.getBytes(), "HmacSHA1");
            Mac mac = Mac.getInstance("HmacSHA1");
            mac.init(keySpec);
            byte[] res = mac.doFinal();
            token = Base64.getEncoder().encodeToString(res);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return token;
    }

    /**
     * get pooled http client
     *
     * @param timeout the request timeout
     */
    private static HttpClient getPooledHttpClient(int timeout) {
        RequestConfig rconf =
                RequestConfig.custom().setConnectTimeout(timeout).setSocketTimeout(timeout).build();
        HttpClient httpClient = HttpClientBuilder.create().setDefaultRequestConfig(rconf).build();

        return httpClient;
    }

}
