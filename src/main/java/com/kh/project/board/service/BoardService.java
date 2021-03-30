package com.kh.project.board.service;

import java.util.List;

import com.kh.project.board.vo.Board;

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
	

}
