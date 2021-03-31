package com.kh.project.message.service;

import java.util.List;

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
		
	// 쪽지함 리스트 - selectList 받은 쪽지함
	@Override
	public List<Message> messageList(String get_id) {
		return messageDao.messageList(get_id);
	}

	// 쪽지함 리스트 - selectList 보낸 쪽지함
	@Override
	public List<Message> messagepushList(String get_id) {
		return messageDao.messagepushList(get_id);
	}
	
	// 쪽지함 COUNT(*) (받은 쪽지 글 수 조회)
	@Override
	public int ListCount(String get_id) {	
		return messageDao.ListCount(get_id);
	}
	
	// 쪽지함 COUNT(*) (보낸 쪽지 글 수 조회)
	@Override
	public int ListCountpush(String get_id) {	
		return messageDao.ListCountpush(get_id);
	}
	
	// 쪽지 상세 view 페이지 
	@Override
	public Message messageView(int msg_seq) {
		return messageDao.messageView(msg_seq);
	}
	
	// 쪽지 수정 페이지
	@Override
	public int messageUpdate(Message message) {
		return messageDao.messageUpdate(message);
	}
	
	// 쪽지 삭제
	@Override
	public int messageDelete(Message message) {
		return messageDao.messageDelete(message);
	}
	
}
