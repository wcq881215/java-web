package com.csf.web.rest.pub;

import com.csf.web.constants.OAConstants;
import com.csf.web.dto.BaseDto;
import com.csf.web.entity.Maintenance;
import com.csf.web.entity.User;
import com.csf.web.rest.APIService;
import com.csf.web.service.MaintenanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * Created by changqi.wu on 17-10-5.
 */
@Controller
@RequestMapping("/web/maintain")
public class MaintainController extends APIService {

    @Autowired
    private MaintenanceService maintenanceService;

    @RequestMapping("/new")
    public String listLateDevice() {
        Page<Maintenance> data = maintenanceService.findAll(0, 3);
        list(data);
        return "device/maintAjaxHtml";
    }

    @RequestMapping("/more")
    public String listDevice() {
        return "device/maintMore";
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
        return BaseDto.newDto(maintenanceService.findAll(page, pageSize));
    }


    @RequestMapping("/detail/{id}")
    public String detailDevice(@PathVariable("id") Long id) {
        Maintenance maintenance = maintenanceService.findById(id);
        attr("data", maintenance);
        return "/device/maintDetail";
    }

    @RequestMapping("/add")
    public BaseDto addMaintentce(String title, String content) {
        int lenth = 20;//简介长度
        lenth = lenth > content.length() ? content.length() : lenth;
        Maintenance maintenance = new Maintenance();
        maintenance.setContent(content);
        maintenance.setDesc(content.substring(0,lenth));
        maintenance.setState(true);
        maintenance.setTime(new Date());
        maintenance.setTitle(title);
        User user = (User) request.getSession().getAttribute(OAConstants.SESSION_USER);
        maintenance.setUser(user);
        maintenanceService.saveDevice(maintenance);
        return BaseDto.newDto("");
    }
}
