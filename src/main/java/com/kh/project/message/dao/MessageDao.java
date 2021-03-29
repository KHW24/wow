package com.kh.project.message.dao;

import org.apache.ibatis.session.SqlSession;
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


}