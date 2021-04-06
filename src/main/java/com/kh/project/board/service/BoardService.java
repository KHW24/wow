package com.kh.project.board.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.project.board.vo.AlertPost;
import com.kh.project.board.vo.Board;
import com.kh.project.board.vo.Criteria;
import com.kh.project.board.vo.Image;
import com.kh.project.board.vo.Reply;
import com.kh.project.board.vo.ReplyPage;

public interface BoardService {

	//board list
	public List<Board> selectList(String category, String onsale, String post_title) throws Exception;
	
	//board list more
	public List<Board> selectListMore(int more, String category, String onsale, String post_title) throws Exception;
	
	//board list count
	public int listCount() throws Exception;
	
	//board detail page
	public Board selectPage(int no) throws Exception;
	
	//board detail page - file
	public Image selectFile(int no) throws Exception;
	
	//board write
	public int insertBoard(Board board) throws Exception;
	
	//board write - file
	public int insertFile(Image image) throws Exception;
	
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
	public ReplyPage getRepliesList(Criteria cri, int no) throws Exception;

	//게시글 당 댓글 총 개수
	public int getCountByPostNo(int postNo) throws Exception;
	
	//아이디별 댓글 총 갯수
	public int allCountReplyById(String id) throws Exception;
	
	//내 댓글 보기
	public List<Reply> getReplybyId(Criteria cri, String id) throws Exception;

	//게시글 신고하기
	public void alertPost(AlertPost alert) throws Exception;
}
