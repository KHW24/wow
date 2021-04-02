package com.kh.project.message.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.board.vo.Criteria;
import com.kh.project.message.dao.MessageDao;
import com.kh.project.message.vo.Message;
import com.kh.project.message.vo.MessagePage;

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
		
//	// 쪽지함 리스트 - selectList 받은 쪽지함
//	@Override
//	public List<Message> messageList(String get_id) {
//		return messageDao.messageList(get_id);
//	}
	
	// 쪽지함 리스트 - selectList 받은 쪽지함 
//	public List<Message> messageList(String get_id, int startPage, int limit) {
//		return messageDao.messageList(get_id, startPage, limit);
//	}

//	public MessagePage messageList(Criteria cri, String get_id) throws Exception {
//		return new MessagePage(
//				messageDao.ListCount(get_id),
//				messageDao.messageList(cri, get_id));
//	}
	
//	public List<Message> selectList(int startPage, int limit) {
//		return messageDao.selectList(startPage, limit);
//	}
//	
//	public List<Message> messageList(String get_id) {
//		return messageDao.messageList(get_id);
//	}
	
//	// 페이징 처리 게시글 조회
//	public List<Message> messageList(MessagePage messagePage) {
//		return messageDao.messageList(messagePage);
//	}
	
	// 쪽지함 리스트 - selectList 받은 쪽지함
	@Override
	public List<Message> messageListt(String get_id) {
		return messageDao.messageListt(get_id);
	}
	
	// 쪽지함 리스트 받은쪽지함&페이징
	@Override
	public MessagePage messageList(Criteria cri, String get_id) throws Exception {
		return new MessagePage(messageDao.ListCount(get_id), messageDao.messageList(cri, get_id));
	}
	
	// 쪽지함 리스트 - selectList 보낸 쪽지함
	@Override
	public MessagePage messagepushList(Criteria cri, String get_id) throws Exception {
		return new MessagePage(messageDao.ListCountpush(get_id), messageDao.messagepushList(cri, get_id));
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
	
	// 쪽지 삭제 ㅠ
	@Override
	public int messageDelete(String msg_seq) {
		return messageDao.messageDelete(msg_seq);
	}
	
}
