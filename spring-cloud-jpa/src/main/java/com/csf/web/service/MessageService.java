package com.csf.web.service;

import com.csf.web.entity.Message;
import com.csf.web.repository.MessageDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by changqi.wu on 17-10-16.
 */
@Service
@Transactional
public class MessageService {

    @Autowired
    private MessageDao messageDao;

    public Message saveMsg(Message msg){
        return messageDao.save(msg);
    }
}
