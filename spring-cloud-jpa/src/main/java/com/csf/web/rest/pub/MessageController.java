package com.csf.web.rest.pub;

import com.csf.web.constants.OAConstants;
import com.csf.web.dto.APIStatus;
import com.csf.web.dto.BaseDto;
import com.csf.web.entity.Location;
import com.csf.web.entity.Message;
import com.csf.web.entity.User;
import com.csf.web.entity.UserRole;
import com.csf.web.rest.APIService;
import com.csf.web.service.LocationService;
import com.csf.web.service.MessageService;
import com.csf.web.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * Created by changqi.wu on 2017/8/8.
 */
@Controller
@RequestMapping("/web/msg")
public class MessageController extends APIService {

    @Autowired
    private MessageService messageService;

    @RequestMapping("/add")
    @ResponseBody
//    public BaseDto addMsg(Long pid,String title,String content,String dept,String team,Long uid){
    public BaseDto addMsg(Message message) {
        message.setTime(new Date());
        message.setState(true);
        message = messageService.saveMsg(message);
        return BaseDto.newDto(message);
    }

    @RequestMapping("/my")
    @ResponseBody
    public BaseDto queryMsg(Integer page,Integer pageSize){
        if(page == null){
            page = 0;
        }
        if(pageSize == null){
            pageSize = 30;
        }
        User u = (User)request.getSession().getAttribute(OAConstants.SESSION_USER);
        return BaseDto.newDto(messageService.queryUserMsg(page,pageSize,u));
    }

}
