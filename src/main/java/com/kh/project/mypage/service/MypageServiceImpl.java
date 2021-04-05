package com.kh.project.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.board.vo.Board;
import com.kh.project.mypage.dao.MypageDao;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageDao mypageDao;
	
	@Override
	public List<Board> myBoardList(String id) throws Exception {
		List<Board> myBoardList = mypageDao.myBoardList(id);
		return myBoardList;
	}

	@Override
	public List<Board> myBoardPage(Map map) throws Exception{
		List<Board> list = mypageDao.myBoardPage(map);
		return list;
	}

//	@Override
//	public List<Board> myBoardPage(String id, String more) throws Exception{
//		List<Board> list = mypageDao.myBoardPage(id, more);
//		return list;
//	}
}
