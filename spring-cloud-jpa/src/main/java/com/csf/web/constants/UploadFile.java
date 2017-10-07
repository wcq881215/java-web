package com.csf.web.constants;

import java.util.Date;

/**
 * Created by changqi.wu on 17-10-6.
 */
public class UploadFile {

    private String fileName;
    private String path;
    private String url;
    private Date time;

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
