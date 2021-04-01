package com.kh.project.message.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.message.vo.Message;

@Repository
public class MessageDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 쪽지 보내기 - insert
	public int messagepost(Message message) throws Exception {
		int cnt = sqlSession.insert("Message.messagepost", message);
		return cnt;
	}
	
	// 쪽지함 리스트 - selectList 받은 쪽지함
	public List<Message> messageList(String get_id) {
		return sqlSession.selectList("Message.messageList", get_id);
	}

	// 쪽지함 리스트 - selectList 보낸 쪽지함
	public List<Message> messagepushList(String get_id) {
		return sqlSession.selectList("Message.messagepushList", get_id);
	}
	
	// 쪽지함 COUNT(*) (받은 쪽지 글 수 조회)
	public int ListCount(String get_id) {	
		return sqlSession.selectOne("Message.ListCount", get_id);
	}
	
	// 쪽지함 COUNT(*) (보낸 쪽지 글 수 조회)
	public int ListCountpush(String get_id) {	
		return sqlSession.selectOne("Message.ListCountpush", get_id);
	}
	
	// 쪽지 상세 view 페이지 
	public Message messageView(int msg_seq) {
		return sqlSession.selectOne("Message.messageView", msg_seq);
	}
	
	// 쪽지 수정 페이지
	public int messageUpdate(Message message) {
		return sqlSession.update("Message.messageUpdate", message);
	}
	
	// 쪽지 삭제
	public int messageDelete(String msg_seq) {
		return sqlSession.delete("Message.messageDelete", msg_seq);
	}

}