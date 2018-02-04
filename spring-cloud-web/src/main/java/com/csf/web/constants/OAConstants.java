package com.csf.web.constants;

import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by changqi.wu on 17-8-27.
 */
public class OAConstants {
    public static final String SESSION_USER = "session_user";

    public static final String COOKIE_USER_NAME = "cookie_user_name";

    public static final String COOKIE_USER_ROLE = "cookie_user_role";

    public static final String COOKIE_USER_PASSWORD = "scookie_user_pwd";

    public static final String COOKIE_USER_TYPE = "cookie_user_type";

    public static final String COOKIE_USER = "cookie_user";

    public static String SERVER_PREFIX = null;

    public static String SERVER_HOST = null;

    public static String upload_path = null;

    public static final String upload_path_default_dir = "upload";

    public static String getUploadPath(HttpServletRequest request) {
        if (StringUtils.isBlank(upload_path)) {
            String path = request.getServletContext().getRealPath("/")+upload_path_default_dir;
            upload_path = path;
            return path;
        } else {
            return upload_path;
        }
    }

}
