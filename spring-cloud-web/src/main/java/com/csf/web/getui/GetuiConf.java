package com.csf.web.getui;

import com.gexin.rp.sdk.base.IPushResult;
import com.gexin.rp.sdk.base.impl.AppMessage;
import com.gexin.rp.sdk.base.impl.SingleMessage;
import com.gexin.rp.sdk.base.impl.Target;
import com.gexin.rp.sdk.exceptions.RequestException;
import com.gexin.rp.sdk.http.IGtPush;
import com.gexin.rp.sdk.template.LinkTemplate;
import com.gexin.rp.sdk.template.style.Style0;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by changqi.wu on 17-12-24.
 */
public class GetuiConf {

    public static final String appId = "Ymdrcd2PVQ78MT3pMi6yU6";
    public static final String AppSecret = "bXJXNw9yuy90o7MnP3ozI7";
    public static final String appKey = "FpJXjy0t7o8fBZSRdSgS83";
    public static final String masterSecret = "ePPJUaMVhx6qqKOjOWSbUA";
    public static final String flag = "com.api.testapp20170916";  //应用标识

    public static String url = "http://sdk.open.api.igexin.com/apiex.htm";

    public static void main(String[] args) {
        try {
//            pushAll();
            sendSingle();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void pushAll() throws IOException {

        IGtPush push = new IGtPush(url, appKey, masterSecret);

        // 定义"点击链接打开通知模板"，并设置标题、内容、链接
        LinkTemplate template = new LinkTemplate();
        template.setAppId(appId);
        template.setAppkey(appKey);
        template.setTitle("欢迎使用个推!");
        template.setText("这是一条推送消息~");
        template.setUrl("http://zd.mayapp.com");

        List<String> appIds = new ArrayList<String>();
        appIds.add(appId);

        // 定义"AppMessage"类型消息对象，设置消息内容模板、发送的目标App列表、是否支持离线发送、以及离线消息有效期(单位毫秒)
        AppMessage message = new AppMessage();
        message.setData(template);
        message.setAppIdList(appIds);
        message.setOffline(true);
        message.setOfflineExpireTime(1000 * 600);

        IPushResult ret = push.pushMessageToApp(message);
        System.out.println(ret.getResponse().toString());//{result=ok, contentId=OSA-1224_Dez4lOlXh07QiIydIsCAs1}
    }

//   static String CID = "863827030027363";
   static String CID = "962d2ca6bd4a5dac086ab0fdbdfada7d6373f5df";
    public static void sendSingle() throws Exception {
        IGtPush push = new IGtPush(url, appKey, masterSecret);
        LinkTemplate template = linkTemplateDemo();
        SingleMessage message = new SingleMessage();
        message.setOffline(true);
        // 离线有效时间，单位为毫秒，可选
        message.setOfflineExpireTime(24 * 3600 * 1000);
        message.setData(template);
        // 可选，1为wifi，0为不限制网络环境。根据手机处于的网络情况，决定是否下发
        message.setPushNetWorkType(0);
        Target target = new Target();
        target.setAppId(appId);
        target.setClientId(CID);
//        target.setAlias(CID);
        IPushResult ret = null;
        try {
            ret = push.pushMessageToSingle(message, target);
        } catch (RequestException e) {
            e.printStackTrace();
            ret = push.pushMessageToSingle(message, target, e.getRequestId());
        }
        if (ret != null) {
            System.out.println(ret.getResponse().toString());  //{result=AliasNotBind}
        } else {
            System.out.println("服务器响应异常");
        }
    }

    public static LinkTemplate linkTemplateDemo() {
        LinkTemplate template = new LinkTemplate();
        // 设置APPID与APPKEY
        template.setAppId(appId);
        template.setAppkey(appKey);

        Style0 style = new Style0();
        // 设置通知栏标题与内容
        style.setTitle("消息通知");
        style.setText("您有一条订单消息，请注意查收");
        // 配置通知栏图标
        style.setLogo("icon.png");
        // 配置通知栏网络图标
        style.setLogoUrl("");
        // 设置通知是否响铃，震动，或者可清除
        style.setRing(true);
        style.setVibrate(true);
        style.setClearable(true);
        template.setStyle(style);

        // 设置打开的网址地址
        template.setUrl("http://zd.mayapp.com");
        return template;
    }


}
