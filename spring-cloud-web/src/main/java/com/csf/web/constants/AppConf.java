package com.csf.web.constants;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

/**
 * Created by changqi.wu on 17-10-7.
 */
@Configuration
public class AppConf {

    @Autowired
    public void config(Environment env) {
        String server = env.getProperty("dev.server.url");
        System.out.println("server address is " + server);
        OAConstants.SERVER_PREFIX = server;
        OAConstants.SERVER_HOST = env.getProperty("server.address");
    }

}
