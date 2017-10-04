package com.csf.web.rest.pub;

import com.csf.web.dto.BaseDto;
import com.csf.web.entity.Device;
import com.csf.web.rest.APIService;
import com.csf.web.service.DeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by changqi.wu on 17-8-30.
 */
@Controller
@RequestMapping("/web/device")
public class DeviceController extends APIService {

    @Autowired
    private DeviceService deviceService;

    @RequestMapping("/new")
    public String listLateDevice() {
        Page<Device> data = deviceService.findAll(0, 4);
        list(data);
        return "device/ajaxHtml";
    }

    @RequestMapping("/more")
    public String listDevice() {
        return "device/more";
    }

    @RequestMapping("/list")
    @ResponseBody
    public BaseDto listDevice(Integer page, Integer pageSize) {
        if (page == null) {
            page = 0;
        }
        if (pageSize == null) {
            pageSize = 20;
        }
        return BaseDto.newDto(deviceService.findAll(page, pageSize));
    }


    @RequestMapping("/detail/{id}")
    public String detailDevice(@PathVariable("id") Long id) {
        Device device = deviceService.findById(id);
        attr("device", device);
        return "/device/detail";
    }

}
