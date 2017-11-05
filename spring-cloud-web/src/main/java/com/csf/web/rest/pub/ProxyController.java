package com.csf.web.rest.pub;

import com.csf.web.dto.BaseDto;
import com.csf.web.entity.Proxy;
import com.csf.web.rest.APIService;
import com.csf.web.service.ProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * Created by changqi.wu on 17-10-17.
 */
@Controller
@RequestMapping("/web/proxy")
public class ProxyController extends APIService {

    @Autowired
    private ProxyService proxyService;

    @RequestMapping("/list")
    public String listProxy() {
        List<Proxy> data = proxyService.findAll();
        attr("data", data);
        return "/proxy/list";
    }

    @RequestMapping("/find")
    @ResponseBody
    public BaseDto findProxy(Long id) {
        Proxy data = proxyService.findOne(id);
        return BaseDto.newDto(data);
    }

    @RequestMapping("/add")
    @ResponseBody
    public BaseDto findProxy(Proxy proxy) {
        proxy.setTime(new Date());
        proxy.setState(true);
        proxy = proxyService.addProxy(proxy);
        return BaseDto.newDto(proxy);
    }

}
