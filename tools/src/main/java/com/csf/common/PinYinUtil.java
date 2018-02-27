package com.csf.common;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import org.apache.commons.lang3.StringUtils;

import java.util.Objects;

public class PinYinUtil {
    public static String getPinYinFirst(String str) {
        if (StringUtils.isBlank(str)) {
            return str;
        }
        HanyuPinyinOutputFormat format = new HanyuPinyinOutputFormat();
        format.setCaseType(HanyuPinyinCaseType.LOWERCASE);
        format.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
        StringBuilder sb = new StringBuilder();
        try {
            for (char c : str.trim().toCharArray()) {
                if (Character.toString(c).matches("[\u4E00-\u9FA5]+")) {
                    String[] temp = PinyinHelper.toHanyuPinyinStringArray(c, format);
                    if (Objects.nonNull(temp)) {
                        sb.append(temp[0].charAt(0));
                    }
                } else {
                    sb.append(Character.toString(c));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
}
