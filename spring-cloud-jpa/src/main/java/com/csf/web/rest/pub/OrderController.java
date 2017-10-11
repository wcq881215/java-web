package com.csf.web.rest.pub;

import com.csf.web.dto.BaseDto;
import com.csf.web.rest.APIService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by changqi.wu on 17-10-12.
 */
@Controller
@RequestMapping("/web/order")
public class OrderController extends APIService {

    @ResponseBody
    @RequestMapping("/user/message")
    public BaseDto getUserOrderMsg() {


        return BaseDto.newDto(null);
    }


    @RequestMapping("/message/{id}")
    public String getUserOrderMsgDetail(@PathVariable("id") Long id) {


        return "";
    }

}
