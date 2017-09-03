package com.csf.web.rest.pub;

import com.csf.web.rest.APIService;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by changqi.wu on 17-8-30.
 */
@RestController
@RequestMapping("/web/device")
public class DeviceController extends APIService {

    @RequestMapping("/list")
    public String listDevice(){


        return success("");
    }

    @RequestMapping("/detail/{id}")
    public String detailDevice(@PathVariable("id")Integer id){

        

        return success("");
    }



}
