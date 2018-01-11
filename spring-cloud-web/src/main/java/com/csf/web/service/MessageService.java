package com.csf.web.service;

import com.csf.web.dto.PageDto;
import com.csf.web.entity.Message;
import com.csf.web.entity.MessageReader;
import com.csf.web.entity.User;
import com.csf.web.repository.MessageDao;
import com.csf.web.repository.MessageReaderDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;

/**
 * Created by changqi.wu on 17-10-16.
 */
@Service
@Transactional
public class MessageService {

    @Autowired
    private MessageDao messageDao;

    @Autowired
    private MessageReaderDao messageReaderDao;

    public Message saveMsg(Message msg) {
        return messageDao.save(msg);
    }

    public PageDto queryUserMsg(Integer page, Integer pageSize, User user) {
        PageDto dto = new PageDto(page, pageSize);
        Long total = messageDao.findUserMessageNo(user.getDept(), user.getTeam(), user.getId());
        dto.setTotal(total);
        if (total > 0) {
            Sort sort = new Sort(Sort.Direction.DESC, "time");
            Pageable pageable = new PageRequest(page, pageSize, sort);
            List<Message> data = messageDao.findUserMessage(user.getDept(), user.getTeam(), user.getId(), pageable);
            if (!CollectionUtils.isEmpty(data)) {
                for (Message msg : data) {
                    MessageReader reader = messageReaderDao.findByUserAndMessage(user, msg);
                    if(reader !=null){
                        msg.setState(true); //已读  -- 临时状态
                    }else {
                        msg.setState(false);//未读
                    }
                }
            }
            dto.setData(data);
        }
        return dto;
    }

    public void readMsg(User user, Long mid) {
        Message message = messageDao.findOne(mid);
        if (message == null) {
            System.out.println("message is not exits");
            return;
        }
        MessageReader messageReader = messageReaderDao.findByUserAndMessage(user, message);
        if (messageReader == null) { // 未读标记未已读
            messageReader = new MessageReader();
            messageReader.setUser(user);
            messageReader.setMessage(message);
            messageReader.setTime(new Date());
            messageReaderDao.save(messageReader);
        }
    }

    public Message findOne(Long id) {
        return messageDao.findOne(id);
    }


    public Message addInOrderMessage(String order) {
        Message msg = new Message();

        return msg;
    }


    private static final String in_title = "订单编号$order已录入，请生产部按照要求开始生产";
    private static final String product_title = "";
    private static final String srv_title = "";
    private static final String service_title = "";

}
