package com.kh.project.board.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.project.board.vo.Board;
import com.kh.project.board.vo.Criteria;
import com.kh.project.board.vo.Reply;
import com.kh.project.board.vo.ReplyPage;

public interface BoardService {

	//board list
	public List<Board> selectList(int page) throws Exception;
	
	//board list count
	public int listCount() throws Exception;
	
	//board detail page
	public Board selectPage(int no) throws Exception;
	
	//board write
	public int insertBoard(Board board) throws Exception;
	

	//board update
	public int updateBoard(Board board) throws Exception;
	
	//board delete
	public int deleteBoard(int no) throws Exception;

	/********************댓글 *************////
	//댓글 등록
	public int insertReply(Reply rep) throws Exception;
	
	//댓글 조회
	public Reply selectReply(int repSeq) throws Exception;

	//댓글 수정
	public int updateReply(Reply rep) throws Exception;
	
	//댓글 삭제
	public int deleteReply(int repSeq) throws Exception;
	
	//페이징해서 댓글 리스트 가져오기
	public ReplyPage getRepliesList(@Param("cri") Criteria cri, @Param("postNo") int no) throws Exception;

	//댓글 총 개수
	public int getCountByPostNo(int postNo) throws Exception;
	

}
