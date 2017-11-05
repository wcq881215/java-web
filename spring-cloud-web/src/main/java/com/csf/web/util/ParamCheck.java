package com.csf.web.util;

import org.apache.commons.lang3.StringUtils;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.Map;

/**
 * Created by changqi.wu on 17-10-19.
 */
public class ParamCheck {
    public static Boolean uncheck(Object... values) {
        return !check(values);
    }
    public static Boolean check(Object... values) {
        for (Object obj : values) {
            if (obj instanceof String) {
                String o = (String) obj;
                if (StringUtils.isBlank(o)) {
                    return false;
                }
            } else if (obj instanceof List) {
                List l = (List) obj;
                if (CollectionUtils.isEmpty(l)) {
                    return false;
                }
            } else if (obj instanceof Map) {
                Map l = (Map) obj;
                if (CollectionUtils.isEmpty(l)) {
                    return false;
                }
            } else {
                if (obj == null) {
                    return false;
                }
            }
        }
        return true;
    }
}
