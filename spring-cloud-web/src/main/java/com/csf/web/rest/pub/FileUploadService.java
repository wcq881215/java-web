package com.csf.web.rest.pub;

import com.csf.web.constants.OAConstants;
import com.csf.web.constants.UpLoadCache;
import com.csf.web.dto.APIStatus;
import com.csf.web.dto.BaseDto;
import com.csf.web.entity.Image;
import com.csf.web.rest.APIService;
import com.csf.web.util.ImageUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by changqi.wu on 17-10-6.
 */
public class FileUploadService extends APIService {

    private static final String file_path = "/upload";

    public Map<String, String> upload(MultipartFile files, HttpServletRequest request) {
        String path = request.getServletContext().getRealPath(file_path);
        String fileName = files.getOriginalFilename();
        System.out.println("===========" + path + "	" + files.getContentType() + "  " + fileName);
        Map<String, String> urlMap = new HashMap<>();
        try {
            Date tody = new Date();
            String name = sf.format(tody);
            File parent = new File(path + "/" + dsf.format(tody));
            if (!parent.exists()) {
                parent.mkdirs();
            }
//            String subfix = files.getContentType().replace("image/", "."); //只适合上传图片
            String subfix = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
            File f = new File(parent, name + subfix);
            files.transferTo(f);
            String src = getServerUrl(request).append(file_path).append("/").append(dsf.format(tody)).append("/").append(f.getName()).toString();
            urlMap.put("file", fileName);
            urlMap.put("src", src);
            urlMap.put("url", f.getPath());
        } catch (Exception e) {
            return null;
        }
        return urlMap;
    }

    private StringBuffer getServerUrl(HttpServletRequest request) {
        if (StringUtils.isBlank(OAConstants.SERVER_PREFIX)) {
            return getServer(request);
        } else {
            return new StringBuffer(OAConstants.SERVER_PREFIX);
        }

    }

    public Image saveImage(String imgStr, String contentType, HttpServletRequest request) {
        Image img = new Image();
        img.setTime(new Date());
        Date tody = new Date();
        String name = sf.format(tody);
        name = name + contentType.replace("image/", ".");
        String path = OAConstants.getUploadPath(request);
        File parent = new File(path + "/" + dsf.format(tody));
        if (!parent.exists()) {
            parent.mkdirs();
        }

        File f = new File(parent, name);
        f.getParentFile().mkdirs();

        img.setPath(f.getPath());
        img.setUrl(getServerUrl(request) + OAConstants.upload_path_default_dir + "/" + parent.getName() + "/" + name);

        ImageUtil iu = new ImageUtil();
        iu.base64ToImage(imgStr, img);
        return img;
    }


}
