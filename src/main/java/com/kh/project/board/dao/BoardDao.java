package com.kh.project.board.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.board.vo.Board;

@Repository
public class BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//insert
	public int insertBoard(Board board) throws Exception {
		int cnt = sqlSession.insert("Board.insertBoard", board);
		return cnt;
	}

}
