package com.kh.project.mypage.service;

import java.util.List;
import java.util.Map;

import com.kh.project.board.vo.Board;

public interface MypageService {

	public List<Board> myBoardList(String id) throws Exception;

	public List<Board> myBoardPage(Map map) throws Exception;
	
	//public List<Board> myBoardPage(String id, String more) throws Exception;
}
