package com.csf.common;


import org.apache.commons.lang3.time.DateUtils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;

public class DateUtil extends DateUtils {

    public static final String PATTERN_YYYY_MM_DD = "yyyy-MM-dd";
    public static final String PATTERN_YYYY_MM_DD_HH_MI = "yyyy-MM-dd HH:mm";
    public static final String PATTERN_YYYYMMDDHHMMSS = "yyyyMMddHHmmss";
    public static final SimpleDateFormat sf = new SimpleDateFormat(PATTERN_YYYYMMDDHHMMSS);

    /**
     * 判断是否为有效的日期格式串
     *
     * @param inDate
     * @return
     */
    public static boolean isValidDate(String inDate) {
        if (inDate == null) return false;

        // set the format to use as a constructor argument
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        if (inDate.trim().length() != dateFormat.toPattern().length()) return false;

        dateFormat.setLenient(false);

        try {
            dateFormat.parse(inDate.trim());
        } catch (ParseException pe) {
            return false;
        }

        return true;
    }

    /**
     * 将指定的Date类型变量转换为指定格式的字符形式
     *
     * @param dt
     * @param format 占位符格式，例如：yyyy-MM-dd
     * @return
     */
    public static String toString(Date dt, String format) {
        DateFormat df = new SimpleDateFormat(format);
        return df.format(dt);
    }

    /**
     * 获取给定日期前后几个月日期
     *
     * @param date   给定日期
     * @param months 月数，正数是日期往后推，负数是日期往前推
     * @return
     */
    public static Date getPreOrNextMonth(Date date, int months) {
        Calendar calendar = GregorianCalendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.MONTH, months);
        return calendar.getTime();
    }

    public static Date getPreOrNextDay(Date date, int days) {
        Calendar calendar = GregorianCalendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DATE, days);
        return calendar.getTime();
    }

    public static String formatDate(Date date, String formatter) {
        if (date == null) {
            return null;
        }
        DateFormat df = new SimpleDateFormat(formatter);
        return df.format(date);
    }

    public static Date getNow(long rawOffset) {
        TimeZone defaultZone = TimeZone.getDefault();
        long diff = 0 - defaultZone.getRawOffset();
        long currentTimeMillis = System.currentTimeMillis();
        return new Date(currentTimeMillis + diff + rawOffset);
    }

    public static Date getCNNow() {
        return getNow(8);
    }

    public static long getRawOffset(int timeZoneOffset) {
        return timeZoneOffset * 60 * 60 * 1000;
    }

    /**
     * 格式化时间
     * @param dt
     * @return
     */
    public static Date parseDate(String dt) {
        try {
            return sf.parse(dt);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
