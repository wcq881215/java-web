package com.csf.log4j;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.*;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by changqi.wu on 2017/7/27.
 */

public class LoggerUtils {
    private static final SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
    private static final String pattern = "[%d{yyyy-MM-dd HH:mm:ss,SSS}] %p %l : %m%n";
    private static final String encoding = "UTF-8";
    private static final String subfix = "_error.log";
    private static final String ERROR_LOG = "errorLog";
    private static String log_path = null;


    public static Logger getMyLogger(Class<?> tClass) {
        Logger logger = Logger.getLogger(tClass);
        setLogPath(logger);
        logger.removeAllAppenders();
        logger.setLevel(Level.ERROR);
        logger.setAdditivity(true);

        FileAppender fp = new DailyRollingFileAppender();
        PatternLayout layout = new PatternLayout(pattern);
        fp.setLayout(layout);
        fp.setFile(log_path + getToday() + subfix);
        fp.setEncoding(encoding);
        fp.setAppend(true);
        fp.activateOptions();

        logger.addAppender(fp);
        return logger;
    }


    public static Logger getLogger(Class<?> tClass) {
        Logger logger = Logger.getLogger(tClass);
        Appender appender = logger.getParent().getAppender(ERROR_LOG);
        if (appender instanceof FileAppender) {
            try {
                FileAppender ap = ((FileAppender) appender);
                String file = ap.getFile();
                if (StringUtils.isBlank(file)) {
                    file = String.join("", "logs/", getToday(), subfix);
                } else {
                    File f = new File(file);
                    if (f.isDirectory()) {
                        file = getToday() + subfix;
                    } else {
                        file = String.join("", f.getParent(), File.separator, getToday(), subfix);
                    }
                }

                ap.setFile(file);
            } catch (Exception e) {
                logger.warn(ERROR_LOG + " file path is error or missing .");
            }
        }
        return logger;
    }

    private static String getToday() {
        return sf.format(new Date());
    }

    private static void setLogPath(Logger logger) {
        if (log_path == null) {
            Appender appender = logger.getParent().getAppender(ERROR_LOG);
            if (appender == null) {
                log_path = "logs/"; //如无配置errorLog文件位置 默认存放在logs文件夹下面
                return;
            }
            if (appender instanceof FileAppender) {
                FileAppender ap = (FileAppender) appender;
                String logPath = ap.getFile();
                if (StringUtils.isNotBlank(logPath)) {
                    try {
                        File f = new File(logPath);
                        log_path = f.getParent();
                        if ("".equals(log_path)) { //当前目录
                            return;
                        }
                        log_path = log_path + File.separator;
                        return;
                    } catch (Exception e) {
                        logger.warn(ERROR_LOG + " file path is error or missing .");
                    }
                }
            }
            log_path = "logs/"; //如无配置errorLog文件位置 默认存放在logs文件夹下面
            return;
        }

    }

}
