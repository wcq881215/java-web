package com.csf.web.service;

import com.csf.web.dto.PageDto;
import com.csf.web.entity.Message;
import com.csf.web.entity.User;
import com.csf.web.repository.MessageDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by changqi.wu on 17-10-16.
 */
@Service
@Transactional
public class MessageService {

    @Autowired
    private MessageDao messageDao;

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
            dto.setData(data);
        }


        return dto;
    }
}
