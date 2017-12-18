

package com.csf.web.util;

import com.csf.web.service.ServiceUtil;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by changqi.wu on 17-10-25.
 */
public class OAUtil {

    private static final String date_pattern = "yyyyMMdd";

    private static final SimpleDateFormat sf = new SimpleDateFormat(date_pattern);

    public static String generateOrderId() {
        StringBuffer sb = new StringBuffer();
        sb.append(sf.format(new Date())).append(ServiceUtil.getMaxId() + 1);
        return sb.toString();
    }

    public static void main(String[] args) {
        System.out.println(generateOrderId());
    }
}
