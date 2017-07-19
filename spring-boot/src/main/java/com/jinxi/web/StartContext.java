package com.jinxi.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;

/**
 * Created by changqi.wu on 17-7-19.
 */
@SpringBootApplication
public class StartContext {
    public static void main(String[] args) {
//        new SpringApplicationBuilder(StartContext.class).run(args);
        SpringApplication.run(StartContext.class,args);
        System.out.println("start server");
    }

}
