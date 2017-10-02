package com.csf.web.rest.pub;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by changqi.wu on 17-9-5.
 */
@Controller
public class PageController {

    @RequestMapping("{scope}/{page}.html")
    public String scope(@PathVariable("scope") String scope, @PathVariable("page") String page) {
        StringBuffer sb = new StringBuffer();
        if (scope != null) {
            sb.append("/").append(scope);
        }

        if (page != null) {
            sb.append("/").append(page);
        }

        return sb.toString();
    }

}
