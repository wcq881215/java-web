package com.csf.web.util;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import com.csf.web.entity.Image;
import org.apache.commons.codec.binary.Base64;


public class ImageUtil {

    public String imageToBase64(Image image) {// 将图片文件转化为字节数组字符串，并对其进行Base64编码处理
        InputStream in = null;
        byte[] data = null;
        // 读取图片字节数组
        try {
            in = new FileInputStream(image.getPath());
            data = new byte[in.available()];
            System.out.println(in.available());
            in.read(data);
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 对字节数组Base64编码
        byte[] en = Base64.encodeBase64(data);
        return new String(en);// 返回Base64编码过的字节数组字符串
    }

    public boolean base64ToImage(String imgStr, Image image) {
        try {
            if (imgStr.startsWith("data:image")) {
                imgStr = imgStr.split("base64,")[1];
            }
            // 解密 byte[]
            byte[] b = Base64.decodeBase64(imgStr);
            // 处理数据
            for (int i = 0; i < b.length; ++i) {
                if (b[i] < 0) {
                    b[i] += 256;
                }
            }
            OutputStream out = new FileOutputStream(image.getPath());
            out.write(b);
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
