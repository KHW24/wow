package com.kh.project.board.service;

import java.util.List;

import com.kh.project.board.vo.Board;

public interface BoardService {

	//board list
	public List<Board> selectList(int page) throws Exception;
	
	//board list count
	public int listCount() throws Exception;
	
	//글 등록
	public int insertBoard(Board board) throws Exception;


}
