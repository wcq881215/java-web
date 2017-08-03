package com.csf.log4j;

import org.apache.log4j.Logger;

import java.io.File;
import java.io.FileReader;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.URLEncoder;

/**
 * Created by changqi.wu on 2017/7/31.
 */

public class LogError {
    private static final Logger logger = Logger.getLogger(LogError.class);

    public static void main(String[] args) {

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

    }
}
