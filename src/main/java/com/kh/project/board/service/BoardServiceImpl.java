package com.kh.project.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.board.dao.BoardDao;
import com.kh.project.board.vo.Board;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDao boardDao;

	//글 등록
	public int insertBoard(Board board) throws Exception{
		int cnt = boardDao.insertBoard(board);
		return cnt;
	}
	
}
