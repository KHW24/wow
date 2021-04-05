package com.kh.project.admin.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kh.project.admin.vo.AdminMs;
import com.kh.project.board.vo.AlertPost;
import com.kh.project.board.vo.Board;
import com.kh.project.board.vo.Criteria;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 멤버십 관리
	public List<AdminMs> selectAdminMs() throws Exception{
		return sqlSession.selectList("Admin.selectAdminMs");
	}
	
	//게시물 관리
	public List<Board> selectPosts(Criteria cri) throws Exception{
		System.out.println(cri);
		System.out.println(cri);
		System.out.println(cri);
		System.out.println(cri);
		System.out.println(cri);
		System.out.println(cri);
		System.out.println(cri);
		System.out.println(cri);
		System.out.println(cri);
		System.out.println(cri);
		System.out.println(cri);
		System.out.println(cri);
		System.out.println(cri);
		System.out.println(cri);
		System.out.println(cri);
		System.out.println(cri);
		System.out.println(cri);
		return sqlSession.selectList("Board.selectPostAdmin",cri);
	}

	//신고내역 삭제
	public void deleteAlert(int alertSeq) throws Exception{
		 sqlSession.delete("Alert.deleteAlert",alertSeq);
	}
	
	
}
