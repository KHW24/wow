package com.kh.project.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.board.dao.BoardDao;
import com.kh.project.board.vo.Board;
import com.kh.project.board.vo.Criteria;
import com.kh.project.board.vo.Reply;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDao boardDao;
	
	//board list
	public List<Board> selectList(int page) throws Exception{
		return boardDao.selectList(page);
	}
	
	//board list count
	public int listCount() throws Exception{
		return boardDao.listCount(); 
	}

	//board write
	public int insertBoard(Board board) throws Exception{
		return boardDao.insertBoard(board);
	}
	
	//board detail page
	public Board selectPage(int no) throws Exception{
		return boardDao.selectPage(no);
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
	public List<Reply> getRepliesList(Criteria cri, int no) throws Exception {
		return boardDao.getRepliesList(cri, no);
	}
	
}
