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
		return sqlSession.selectList("Board.selectPostAdmin",cri);
	}
	//신고내역 삭제
	public int deleteAdminMs (int mshipSeq) throws Exception{
		return sqlSession.delete("Membership.deleteAdminMs",mshipSeq);
	} 
	
	//신고게시글 조회
	public List<AlertPost> selectAlert() throws Exception{
		return sqlSession.selectList("Alert.selectAlerts");
	}

	//신고내역 삭제
	public void deleteAlert(int alertSeq) throws Exception{
		 sqlSession.delete("Alert.deleteAlert",alertSeq);
	}
	
}
