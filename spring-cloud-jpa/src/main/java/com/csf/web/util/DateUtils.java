package com.csf.web.util;

import java.util.Calendar;
import java.util.Date;

/**
 * Created by changqi.wu on 17-10-8.
 */
public class DateUtils {

    /**
     * @param amount 变动日期区间 以月为单位
     * @return
     */
    public static Date getDateByMongth(int amount){
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MONTH,amount);
        return calendar.getTime();
    }
    /**
     * @param amount 变动日期区间 以天为单位
     * @return
     */
    public static Date getLastDay(int amount){
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DAY_OF_YEAR,amount);
        return calendar.getTime();
    }

}
