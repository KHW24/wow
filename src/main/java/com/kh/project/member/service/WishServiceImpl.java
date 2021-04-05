package com.kh.project.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.member.dao.WishDao;
import com.kh.project.member.vo.Wish;

@Service
public class WishServiceImpl implements WishService{

	@Autowired
	WishDao wishDao;
	
	// insert
	@Override
	public int wishInsert(Wish wish) throws Exception {
		return wishDao.wishInsert(wish);
	}
	
	// delete
	@Override
	public int wishDelete(String post_no) throws Exception {
		return wishDao.wishDelete(post_no);
	}
}
