package com.csf.log4j;

import org.apache.log4j.Logger;

import java.io.FileReader;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.URLEncoder;

/**
 * Created by changqi.wu on 2017/7/31.
 */

public class LogError {
    private static final Logger logger = Logger.getLogger(LogError.class);

    public static void main(String[] args) throws InterruptedException {
        boolean flag = true;
        while(flag){
            log4j();
            Thread.sleep(1000);
        }

//        log4j();
    }

    public static void log4j() {

        try {
           int s = 10 / 0;
        } catch (Exception e) {
            logger.error(e, e);
        }

        try {
            Class.forName("com.jinxi.Test");
        } catch (Exception e) {
            logger.error(e, e);
        }
        try {
            String[] arrs = {};
            System.out.println(arrs[1]);
        } catch (Exception e) {
            logger.error(e, e);
        }
        try {
            FileReader fr = new FileReader("D:\\share\\logstash\\error2xxx.log");
        } catch (Exception e) {
            logger.error(e, e);
        }
        try {
            FileReader fr = new FileReader("D:\\share\\logstash\\error2.log");
            fr.close();
            fr.read();
        } catch (Exception e) {
            logger.error(e, e);
        }
        try {
            Socket sc = new Socket("192.168.1.52",9201);
        } catch (Exception e) {
            logger.error(e, e);
        }
        try {
            String s = null;
            s.join("","xx");
        } catch (Exception e) {
            logger.error(e, e);
        }
        try {
            Thread s = new Thread();
            s.interrupt();
            s.join(100);
        } catch (Exception e) {
            logger.error(e, e);
        }
        try {
            URLEncoder.encode("xxx","utf89");
        } catch (Exception e) {
            logger.error(e, e);
        }
        try {
            ServerSocket ss = new ServerSocket(1234);
            ss = new ServerSocket(1234);
        } catch (Exception e) {
            logger.error(e, e);
        }

        logger.error("java.IO.Exception  Connection reset by peer :::",null);
        logger.error("error_message: NettyChannel failed to connect to server, url: motan://10.0.2",null);
        logger.error("NettyClient request Error: url=motan://10.0.251.65:7043/com.csf.service.datasupply.service.ICsfIndexService requestId=1576577429266083861 interface=com.csf.service.datasupply.service.ICsfIndexService method=realtimeState(java.lang.String) com.weibo.api.motan.exception.MotanServiceException: error_message: NettyChannel send request to server Error: url=motan://10.0.251.65:7043/com.csf.service.datasupply.service.ICsfIndexService local=/10.0.251.65:15360 requestId=1576577429266083861 interface=com.csf.service.datasupply.service.ICsfIndexService method=realtimeState(java.lang.String), status: 503, error_code: 10001,r=null\n" +
                " at com.weibo.api.motan.transport.netty.NettyChannel.request(NettyChannel.java:101)\n" +
                " at com.weibo.api.motan.transport.netty.NettyClient.request(NettyClient.java:169)\n" +
                " at com.weibo.api.motan.transport.netty.NettyClient.request(NettyClient.java:116)\n",null);

    }
}
