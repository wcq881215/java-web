package com.jinxi.web.controller;

import com.jinxi.web.dao.SysConfigDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by changqi.wu on 17-8-1.
 */
@Controller
@RequestMapping("/pub/cfg")
public class SysConfigController extends BaseService {

    @Autowired
    private SysConfigDao sysConfigDao;

    @ResponseBody
    @RequestMapping("/sys")
    public String getSysCfg() {
        return success(sysConfigDao.findAll());
    }


}
