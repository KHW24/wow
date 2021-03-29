package com.kh.project.board.service;

import com.kh.project.board.vo.Board;

public interface BoardService {
	
	//글 등록
	public int insertBoard(Board board) throws Exception;

}
