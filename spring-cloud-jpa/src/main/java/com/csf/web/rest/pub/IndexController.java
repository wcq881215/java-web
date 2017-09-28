package com.csf.web.rest.pub;

import com.csf.web.rest.APIService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by changqi.wu on 17-9-3.
 */
@Controller
public class IndexController extends APIService{


    @RequestMapping(path ={"/","/index","/home"})
    public String index(){

        return "index";
    }

    @RequestMapping(path ={"/admin","/root","/admin/login"})
    public String admin(){

        return "index";
    }

    @RequestMapping(value = "/page/member/{page}",method = {RequestMethod.GET,RequestMethod.POST})
    public String userPage(@PathVariable("page") String page) {

        return "member/".concat(page);
    }

    @RequestMapping(value = "/page/admin/{page}",method = {RequestMethod.GET,RequestMethod.POST})
    public String adminPage(@PathVariable("page") String page) {

        return "admin/".concat(page);
    }

    @RequestMapping(value="/page/{scope}/{page}",method = {RequestMethod.GET,RequestMethod.POST})
    public String userPage(@PathVariable("scope") String scope,@PathVariable("page") String page) {

        StringBuffer sb = new StringBuffer();
        if (scope != null) {
            sb.append("/").append(scope);
        }

        if (page != null) {
            sb.append("/").append(page);
        }

        return sb.toString();
    }


    @RequestMapping("/page/{scope}/{business}/{page}")
    public String page(@PathVariable String scope, @PathVariable String business, @PathVariable String page) {

        StringBuilder sb = new StringBuilder();
        if (scope != null && !"".equals(scope)) {
            sb.append("/").append(scope);
        }
        if (business != null && !"".equals(business)) {
            sb.append("/").append(business);
        }
        if (page != null && !"".equals(page)) {
            sb.append("/").append(page);
        }
        return sb.toString();
    }


}
