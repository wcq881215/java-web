package com.jinxi.web.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by changqi.wu on 17-7-19.
 */
@RestController
@RequestMapping("article")
public class ArticleController {

    @RequestMapping("list")
    public String listArticle(){
        System.out.println("list article");
        return "/success";
    }
}
