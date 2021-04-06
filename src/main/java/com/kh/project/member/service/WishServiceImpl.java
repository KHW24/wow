package com.kh.project.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.board.vo.Board;
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
	@Override
	public int wishYNInsert(Board board) throws Exception {
		return wishDao.wishYNInsert(board);
	}
	
	
	// delete
	@Override
	public int wishDelete(int post_no) throws Exception {
		return wishDao.wishDelete(post_no);
	}
	
	// 찜 하트 받아오기
	public List<Wish> wishHeart() throws Exception {
		return wishDao.wishHeart();
	}
	
	// wishList
	public List<Wish> wishList(String get_id) throws Exception {
		return wishDao.wishList(get_id);
	}
	
	// 더보기
	public List<Wish> wishListMore(Map map) throws Exception {
		List<Wish> wishListMore = wishDao.wishListMore(map);
		return wishListMore;
	}
	
	
	
	
	
}
