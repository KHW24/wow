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
		
	// select page
	public Board selectPage(int no) throws Exception {
		return sqlSession.selectOne("Board.selectPage", no);
	}
	
	//insert
	public int insertBoard(Board board) throws Exception {
		return sqlSession.insert("Board.insertBoard", board);
	}
	
	//update
	public int updateBoard(Board board) throws Exception{
		return sqlSession.update("Board.updateBoard", board);
	}
	
	//delete
	public int delteBoard(int no) throws Exception{
		System.out.println("dao+"+no);
		return sqlSession.delete("Board.deleteBoard", no);
	}
	

}
