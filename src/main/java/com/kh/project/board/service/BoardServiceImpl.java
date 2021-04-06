package com.kh.project.board.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.board.dao.BoardDao;
import com.kh.project.board.vo.AlertPost;
import com.kh.project.board.vo.Board;
import com.kh.project.board.vo.Criteria;
import com.kh.project.board.vo.Image;
import com.kh.project.board.vo.Reply;
import com.kh.project.board.vo.ReplyPage;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDao boardDao;
	
	//board list
	public List<Board> selectList(String category, String onsale, String post_title) throws Exception{
		return boardDao.selectList(category, onsale, post_title);
	}
	
	//board list more
	public List<Board> selectListMore(int more) throws Exception{
		return boardDao.selectListMore(more); 
	}
	
	//board list count
	public int listCount() throws Exception{
		return boardDao.listCount(); 
	}

	//board detail page
	public Board selectPage(int no) throws Exception{
		return boardDao.selectPage(no);
	}
	
	//board detail page - file
	public Image selectFile(int no) throws Exception{
		return boardDao.selectFile(no);
	}
	
	//board write
	public int insertBoard(Board board) throws Exception{
		return boardDao.insertBoard(board);
	}
	//board write - file
	public int insertFile(Image image) throws Exception{
		return boardDao.insertFile(image);
	}
	
	//board update
	public int updateBoard(Board board) throws Exception{
		return boardDao.updateBoard(board);
	}
	

	//board delete
	public int deleteBoard(int no) throws Exception{
		return boardDao.delteBoard(no);
	}
	

/////***********************댓글***************///
	//댓글 등록
	@Override
	public int insertReply(Reply rep) throws Exception {
		return boardDao.insertRep(rep);
	}

	//댓글 조회
	@Override
	public Reply selectReply(int rep) throws Exception {
		return boardDao.selectRep(rep);
	}

	//댓글 수정
	@Override
	public int updateReply(Reply rep) throws Exception {
		return boardDao.updateRep(rep);
	}

	//댓글 삭제
	@Override
	public int deleteReply(int repSeq) throws Exception {
		return boardDao.deleteRep(repSeq);
	}

	@Override
	public ReplyPage getRepliesList(Criteria cri, int postNo) throws Exception {
		return new ReplyPage(boardDao.getCountByPostNo(postNo), boardDao.getListWithPaging(cri, postNo));
	}
	
	//댓글 총 개수
	public int getCountByPostNo(int postNo) throws Exception{
		int repCnt = boardDao.getCountByPostNo(postNo);
		return repCnt;
	}

	//내 댓글 보기
	@Override
	public List<Reply> getReplybyId(Criteria cri, String id) throws Exception {
		return boardDao.getReplybyId(cri, id);
	}

	//게시글 신고하기
	@Override
	public void alertPost(AlertPost alert) throws Exception {
		boardDao.alertPost(alert);
	}

	@Override
	public int allCountReplyById(String id) throws Exception {
		return boardDao.allCountReplyById(id);
	}

	

	
}
