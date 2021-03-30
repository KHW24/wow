package com.kh.project.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.board.dao.BoardDao;
import com.kh.project.board.vo.Board;

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

	//board detail page
	public Board selectPage(int no) throws Exception{
		return boardDao.selectPage(no);
	}
	
	//board write
	public int insertBoard(Board board) throws Exception{
		return boardDao.insertBoard(board);
	}
	
	//board update
	public int updateBoard(Board board) throws Exception{
		return boardDao.updateBoard(board);
	}
	
	//board delete
	public int deleteBoard(int no) throws Exception{
		return boardDao.delteBoard(no);
	}
	
	
}
