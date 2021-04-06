package com.kh.project.member.service;

import java.util.List;
import java.util.Map;

import com.kh.project.board.vo.Board;
import com.kh.project.member.vo.Wish;

public interface WishService {

	// insert
	public int wishInsert(Wish wish) throws Exception;
	public int wishYNInsert(Board board) throws Exception;
	
	// delete
	public int wishDelete(int post_no) throws Exception;

	// 찜 하트 받아오기
	public List<Wish> wishHeart() throws Exception;

	// wishList
	public List<Wish> wishList(String get_id) throws Exception;
	
	// 더보기
	public List<Wish> wishListMore(Map map) throws Exception;
	
	
}
