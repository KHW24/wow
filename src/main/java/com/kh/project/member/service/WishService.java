package com.kh.project.member.service;

import com.kh.project.member.vo.Wish;

public interface WishService {

	// insert
	public int wishInsert(Wish wish) throws Exception;
	
	// delete
	public int wishDelete(String post_no) throws Exception;
}
