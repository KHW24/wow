package com.kh.project.message.service;

import java.util.List;

import com.kh.project.board.vo.Criteria;
import com.kh.project.message.vo.Message;
import com.kh.project.message.vo.MessagePage;

public interface MessageService {

	// 쪽지보내기 - insert
	public int messagepost(Message message) throws Exception;
	
	/* 
//	// 쪽지함 리스트 - selectList 받은 쪽지함
//	public List<Message> messageList(String get_id);
	
	// 쪽지함 리스트 - selectList 받은 쪽지함 
//	public List<Message> messageList(String get_id, int startPage, int limit);
	
//	public List<Message> messageList(String get_id);
	
//	public MessagePage messageList(Criteria cri, String get_id) throws Exception;
	
	// 페이징 처리 게시글 조회
//	public List<Message> messageList(MessagePage messagePage); */
	
	public List<Message> messageListt(String get_id);
	
	// 쪽지 리스트 받은쪽지함 &페이징
	public MessagePage messageList(Criteria cri, String get_id) throws Exception;
	
	// 쪽지함 리스트 - selectList 보낸 쪽지함&
	public MessagePage messagepushList(Criteria cri, String get_id) throws Exception;

	// 쪽지함 COUNT(*) (받은 쪽지 글 수 조회)
	public int ListCount(String get_id);
	
	// 쪽지함 COUNT(*) (보낸 쪽지 글 수 조회)
	public int ListCountpush(String get_id);

	// 쪽지 상세 view 페이지 
	public Message messageView(int msg_seq);
	
	// 쪽지 수정 페이지
	public int messageUpdate(Message message);
	
	// 쪽지 삭제 ㅜ
	public int messageDelete(String msg_seq);
	
}
