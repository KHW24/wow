package com.kh.project.member.service;

import java.util.List;

import com.kh.project.member.vo.Wish;

public interface WishService {

	// insert
	public int wishInsert(Wish wish) throws Exception;
	
	// delete
	public int wishDelete(int post_no) throws Exception;

	// 찜 하트 받아오기
	public List<Wish> wishHeart() throws Exception;

}
