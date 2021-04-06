package com.kh.project.admin.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kh.project.admin.vo.AdminMs;
import com.kh.project.board.vo.AlertPost;
import com.kh.project.board.vo.Board;
import com.kh.project.board.vo.Criteria;
import com.kh.project.member.vo.Member;

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
	
	public int allCountAlertMember() throws Exception{
		return sqlSession.selectOne("Admin.allCountAlertMember");
	}

	public List<Member> selectListAlertMember() throws Exception{
		return sqlSession.selectList("Member.selectListAlertMember");
	}
	
	// 멤버십 삭제
	public int deleteMembership(String mshipSeq) throws Exception{
		return sqlSession.delete("Membership.deleteMembership", mshipSeq);
	}
}
