package com.kh.project.member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.board.vo.Board;
import com.kh.project.member.vo.Wish;

@Repository
public class WishDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// insert
	public int wishInsert(Wish wish) throws Exception {
		return sqlSession.insert("Wish.wishInsert", wish);
	}
	public int wishYNInsert(Board board) throws Exception {
		return sqlSession.insert("Wish.wishYNInsert", board);
	}
	
	// delete
	public int wishDelete(int post_no) throws Exception {
		return sqlSession.delete("Wish.wishDelete", post_no);
	}
	
	// 찜 하트 받아오기
	public List<Wish> wishHeart() throws Exception {
		return sqlSession.selectList("Wish.wishHeart");
	}
	
	// wishList
	public List<Wish> wishList(String get_id) throws Exception {
		return sqlSession.selectList("Wish.wishList", get_id);
	}
	
	public List<Wish> wishListMore(Map map) throws Exception {
		List<Wish> wishListMore =  sqlSession.selectList("Wish.wishListMore", map);
		return wishListMore;
	}
	
	
}
