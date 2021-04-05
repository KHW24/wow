package com.kh.project.message.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.board.vo.Criteria;
import com.kh.project.board.vo.Reply;
import com.kh.project.message.vo.Message;
import com.kh.project.message.vo.MessagePage;

@Repository
public class MessageDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 쪽지 보내기 - insert
	public int messagepost(Message message) throws Exception {
		int cnt = sqlSession.insert("Message.messagepost", message);
		return cnt;
	}
	
	/*
	 * // 쪽지함 리스트 - selectList 받은 쪽지함 
	 * public List<Message> messageList(String
	 * get_id) { return sqlSession.selectList("Message.messageList", get_id); }
	 */
	
	// 쪽지함 리스트 - selectList 받은 쪽지함 
//	public List<Message> messageList(String get_id, int startPage, int limit) { 
//		int startRow = (startPage - 1) * limit;
//		//RowBounds row = new RowBounds(startRow, limit);
//		MessagePage mesPage = new MessagePage();
//		mesPage.setStart(startRow+1);
//		mesPage.setEnd(startRow+10);
//		
////		Map<String,>
//
//		return sqlSession.selectList("Message.messageList", mesPage); 
//	}
	
//	public List<Message> messageList(Criteria cri, String get_id) throws Exception { 
//		Map<String, Object> map = new HashMap<>();
//		
//		map.put("cri", cri);
//		map.put("get_id", get_id);
//		List<Message> megs = sqlSession.selectList("Message.messageList", map);
//		return megs;
//	}
	
//	public List<Message> messageList(String get_id) {
//		return sqlSession.selectList("Message.messageList", get_id);
//	}
	
//	public List<Message> messageList(MessagePage messagePage) {
//		return sqlSession.selectList("Message.messageList", messagePage);
//	}
	
	
	// 쪽지함 COUNT(*) (id별 받은 쪽지 글 수 조회)
//	public List<Message> selectList(int startPage, int limit) {	
//		int startRow = (startPage-1)*limit;
//		MessagePage messagePage = new MessagePage();
//		messagePage.setStart(startRow+1);
//		messagePage.setEnd(startRow+10);
//		return sqlSession.selectList("Message.selectList", messagePage);
//	}
	
	// 쪽지함 리스트 - selectList 보낸 쪽지함
	public List<Message> messageListt(String get_id) {
		return sqlSession.selectList("Message.messageListt", get_id);
	}

	// 쪽지함 리스트&페이징 받은 쪽지함
	public List<Message> messageList(Criteria cri, String get_id) throws Exception{
		Map<String, Object> map = new HashMap<>();
			
		map.put("cri", cri);
		map.put("get_id", get_id);
		
		List<Message> messages = sqlSession.selectList("Message.messageList",map);
		return messages;
	}
	
	// 쪽지함 리스트 - selectList 보낸 쪽지함
	public List<Message> messagepushList(Criteria cri, String get_id) throws Exception {
		Map<String, Object> map = new HashMap<>();
		
		map.put("cri", cri);
		map.put("get_id", get_id);
		
		List<Message> messages = sqlSession.selectList("Message.messagepushList", map);
		return messages;
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
	public Message messageView(String msg_seq) {
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