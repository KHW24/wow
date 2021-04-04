package com.kh.project.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.board.vo.AlertPost;
import com.kh.project.board.vo.Board;
import com.kh.project.board.vo.Criteria;
import com.kh.project.board.vo.Image;
import com.kh.project.board.vo.Reply;

@Repository
public class BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//select list
	public List<Board> selectList(int page){
		return sqlSession.selectList("Board.selectList", page );
	}
	
	//select list more
	public List<Board> selectListMore(int more){
			return sqlSession.selectList("Board.selectListMore", more );
	}
	
	//select list Count
	public int listCount() {
		return sqlSession.selectOne("Board.listCount");
	}
		
	// select page
	public Board selectPage(int no) throws Exception {
		return sqlSession.selectOne("Board.selectPage", no);
	}
	
	// select file
	public Image selectFile(int no) throws Exception{
		return sqlSession.selectOne("Board.selectFile", no);
	}
	
	//insert board
	public int insertBoard(Board board) throws Exception {
		return sqlSession.insert("Board.insertBoard", board);
	}
	
	//insert board- file
	public int insertFile(Image image) throws Exception {
		return sqlSession.insert("Board.insertFile", image);
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
	public List<Reply> getListWithPaging( Criteria cri, int postNo) throws Exception{
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("cri", cri);
		map.put("postNo",postNo);
		
		List<Reply> replies = sqlSession.selectList("Reply.getListWithPaging",map);
		return replies;
	}
	
	//댓글 총 개수
	public int getCountByPostNo(int postNo) throws Exception{
		int repCnt = sqlSession.selectOne("Reply.getCountByPostNo",postNo);
		return repCnt;
	}
	
	//내 댓글 보기
	public List<Reply> getReplybyId(String id) throws Exception{
		List<Reply> myReplies = sqlSession.selectList("Reply.selectReply",id);
		return myReplies;
	}
	
	//게시글 신고하기
	public void alertPost(AlertPost alert) throws Exception{
		sqlSession.insert("Alert.insertAlertPost",alert);
		sqlSession.update("Alert.updateAlertCnt",alert);
	}
}
