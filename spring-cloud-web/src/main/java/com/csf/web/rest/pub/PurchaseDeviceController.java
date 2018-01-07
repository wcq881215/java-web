package com.csf.web.rest.pub;

import com.csf.web.dto.BaseDto;
import com.csf.web.entity.PurchaseDevice;
import com.csf.web.rest.APIService;
import com.csf.web.service.PurchaseDeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2018/1/7.
 */
@Controller
@RequestMapping("/web/purchase")
public class PurchaseDeviceController extends APIService{

    @Autowired
    private PurchaseDeviceService purchaseDeviceService;


    @RequestMapping("/save")
    public BaseDto savePurchase(){
        PurchaseDevice device = new PurchaseDevice();
        return BaseDto.newDto(device);
    }

}
