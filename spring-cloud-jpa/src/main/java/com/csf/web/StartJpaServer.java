package com.csf.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

/**
 * Created by changqi.wu on 2017/8/8.
 */
@SpringBootApplication
@EnableJpaRepositories
public class StartJpaServer {

    public static void main(String[] args) {
        SpringApplication.run(StartJpaServer.class,args);
    }

}
