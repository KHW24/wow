package com.kh.project.admin.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kh.project.admin.vo.AdminMs;
import com.kh.project.board.vo.AlertPost;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 멤버십 관리
	public List<AdminMs> selectAdminMs() throws Exception{
		return sqlSession.selectList("Admin.selectAdminMs");
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
