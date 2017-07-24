package com.jinxi.web.service;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * Created by changqi.wu on 2017/7/20.
 */

public class LogFile {

    private static Random random = new Random();
    private static final SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss,SSS");

    public static void main(String[] args) throws IOException, InterruptedException {
        BufferedWriter br = new BufferedWriter(new FileWriter("D:\\share\\logstash\\run.log"));
        boolean flag = true;
        int i =0;
        while (flag){
            Thread.sleep(20);
            br.write(creatInfo(i));
            br.flush();
            i++;
        }

        br.close();
    }


    public static String creatInfo(int index) {
        StringBuffer sb = new StringBuffer();
        if (index % 20 == 0) {
            sb.append(creatException());
        } else {
            String time = sf.format(new Date());
            String url = getAPIURL(index);
            String info = info_templete.replace("${0}", time).replace("${1}", url).replace("${2}", random.nextInt(1000) + "");
            sb.append(info);
        }
        sb.append("\n");
        System.out.println(sb.toString());
        return sb.toString();
    }


    public static String getAPIURL(int index) {
        int size = urls.size();
        return urls.get(index % size);
    }

    public static String creatException() {
        StringBuffer sb = new StringBuffer();
        int s1 = random.nextInt(2);
        if (s1 == 1) {
            sb.append(excep1_templete);
        } else {
            sb.append(excep2_templete);
        }
        return sb.toString();
    }

    public static final String info_templete = "INFO ${0} com.csf.frame.interceptors.LoggingInterceptor     (38) -  Request uri [ ${1} ] cost time ${2} ms";

    public static final String excep1_templete = "Caused by: java.net.ConnectException: Connection timed out";
    public static final String excep2_templete = "javax.ws.rs.NotFoundException: Could not find resource for full path: http://localhost:7027/shukugang/api/ucenter/optional/shares/add";

    private static List<String> urls = new ArrayList<>();

    static {
        urls.add("/ucenter/optional/shares/add");
        urls.add("/csf/index/realtime/state");
        urls.add("/stock/realtime/state");
        urls.add("/hq/stock/time/share/daily");
        urls.add("/csf/index/capital/flows/ranking");
        urls.add("/csf/index/capital/flows/details");
        urls.add("/financeData/queryMarket");
        urls.add("/hqprice/realtime");
        urls.add("/hq/stock/price/date");
        urls.add("/hq/stock/price");
        urls.add("/hq/index/price.json");
        urls.add("/hq/index/price");
        urls.add("/market/index/realtime/quotes");
        urls.add("/market/index/realtime/indicators");
    }


}
