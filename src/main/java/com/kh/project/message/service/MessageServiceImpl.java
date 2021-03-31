package com.kh.project.message.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.message.dao.MessageDao;
import com.kh.project.message.vo.Message;

@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	MessageDao messageDao;

	// 쪽지보내기 - insert
	@Override
	public int messagepost(Message message) throws Exception {
		int cnt = messageDao.messagepost(message);
		return cnt;
	}
		
	// 쪽지함 리스트 - select
	@Override
	public Message messageList(String get_id) throws Exception {
		Message message = messageDao.messageList(get_id);
		return message;
	}

	
}
