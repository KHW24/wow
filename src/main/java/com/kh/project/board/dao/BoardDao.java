package com.kh.project.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.board.vo.Board;
import com.kh.project.board.vo.Criteria;
import com.kh.project.board.vo.Reply;

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

	/********************댓글****************************************//////
	//댓글 등록
	public int insertRep(Reply rep) throws Exception{
		int cnt = sqlSession.insert("Reply.insertReply",rep);
		return cnt;
	};
	
	//댓글 조회
	public Reply selectRep(int repSeq) throws Exception {
		Reply rep = sqlSession.selectOne("Reply.selectReply",repSeq);
		return rep;
	}
	
	//댓글 수정
	public int updateRep(Reply rep) throws Exception{
		int cnt = sqlSession.update("Reply.updateReply",rep);
		return cnt;
	}
	
	//댓글 삭제
	public int deleteRep(int repSeq) throws Exception{
		int cnt = sqlSession.delete("Reply.deleteReply",repSeq);
		return cnt;
	}
	
	//댓글 리스트
	public List<Reply> getRepliesList(Criteria cri, int postNo) throws Exception{
		List<Reply> replies = sqlSession.selectList("Reply.getRepliesList",postNo);
		return replies;
	}
}
