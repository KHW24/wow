package com.kh.project.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.board.vo.Board;

@Repository
public class BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//select list
	public List<Board> selectList(int page){
		return sqlSession.selectList("Board.selectList", page );
	}
	
	//select list Count
	public int listCount() {
		return sqlSession.selectOne("Board.listCount");
	}
		
	//insert
	public int insertBoard(Board board) throws Exception {
		int cnt = sqlSession.insert("Board.insertBoard", board);
		return cnt;
	}
	
	// select page
	public Board selectPage(int no) throws Exception {
		System.out.println("dao+"+no);
		return sqlSession.selectOne("Board.selectPage", no);
	}

}
