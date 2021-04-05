package com.kh.project.mypage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.board.vo.Board;

@Repository
public class MypageDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Board> myBoardList(String id) throws Exception {
		return sqlSession.selectList("Board.myBoardList", id);
	}
	
	public List<Board> myBoardPage(Map map) throws Exception {
		List<Board> list = sqlSession.selectList("Board.myBoardPage", map);
		return list;
	}
	
//	public List<Board> myBoardPage(String id, String more) throws Exception {
//		Map<String, String> list = sqlSession.selectMap("Board.myBoardPage", id, more);
//		return (List<Board>) list;
//	}
}
