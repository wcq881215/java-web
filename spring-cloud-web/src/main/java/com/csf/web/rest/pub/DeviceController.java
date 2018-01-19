
package com.csf.web.rest.pub;

import com.csf.web.constants.OAConstants;
import com.csf.web.dto.APIStatus;
import com.csf.web.dto.BaseDto;
import com.csf.web.entity.*;
import com.csf.web.rest.APIService;
import com.csf.web.service.DeviceService;
import com.csf.web.service.ProxyService;
import com.csf.web.util.ParamCheck;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * Created by changqi.wu on 17-8-30.
 */
@Controller
@RequestMapping("/web/device")
public class DeviceController extends FileUploadService {

    @Autowired
    private DeviceService deviceService;
    @Autowired
    private ProxyService proxyService;

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

    @RequestMapping("/list/select")
    public String selectDevice() {
        List<Device> data = deviceService.findAll();
        attr("data", data);
        return "/device/list";
    }

    @RequestMapping("/add")
    @ResponseBody
    public BaseDto addDevice(String sn,
                             String _name,
                             String type,
                             Long proxy,
                             Integer number,
                             Double price,
                             String _desc) {
        Device device = new Device();
        if (ParamCheck.uncheck(sn, _name, type, proxy, number, price, _desc)) {
            return BaseDto.newDto(APIStatus.param_error);
        }
        Proxy p = proxyService.findOne(proxy);
        if (p == null) {
            return BaseDto.newDto(APIStatus.param_error);
        }
        device.setDesc(_desc);
        device.setName(_name);
        device.setNumber(number);
        device.setPrice(price);
        device.setProxy(p);
        device.setSn(sn);
        device.setState(true);
        device.setTime(new Date());
        device.setType(type);
        deviceService.saveDevice(device);
        return BaseDto.newDto(device);
    }

    @RequestMapping("/update")
    @ResponseBody
    public BaseDto updateDevice(
            Long id,
            String sn,
            String _name,
            String type,
            Long proxy,
            Integer number,
            Double price,
            String _desc) {

        if (ParamCheck.uncheck(id, sn, _name, type, proxy, number, price, _desc)) {
            return BaseDto.newDto(APIStatus.param_error);
        }
        Device device = deviceService.findById(id);
        Proxy p = proxyService.findOne(proxy);
        if (p == null) {
            return BaseDto.newDto(APIStatus.param_error);
        }
        device.setDesc(_desc);
        device.setName(_name);
        device.setNumber(number);
        device.setPrice(price);
        device.setProxy(p);
        device.setSn(sn);
        device.setState(true);
        device.setTime(new Date());
        device.setType(type);
        deviceService.saveDevice(device);
        return BaseDto.newDto(device);
    }

    @RequestMapping("/image")
    @ResponseBody
    public BaseDto uploadImg(String img, Long did, String type, String alt,
                             HttpServletRequest request) {
        if (ParamCheck.uncheck(img, did, type, alt)) {
            return BaseDto.newDto(APIStatus.param_error);
        }
        //clear old img
        deviceService.clearImg(did);
        String imgs[] = img.split("##@##");
        String types[] = type.split("##@##");
        String alts[] = alt.split("##@##");
        for (int i = 0; i < imgs.length; i++) {
            String imag = imgs[i];
            Image image = saveImage(imag, types[i], request);
            DeviceImg im = new DeviceImg();
            im.setUpload(image.getTime());
            im.setState(true);
            im.setSrc(image.getUrl());
            im.setDid(did);
            im.setAlt(alts[i]);
            im.setPath(image.getPath());
            deviceService.saveDeviceImg(im);
        }

        return BaseDto.newDto("");
    }

    @RequestMapping("/delete")
    @ResponseBody
    public BaseDto updateDevice(Long id) {
        deviceService.deleteDevice(id);
        return BaseDto.newDto("");
    }


}
