package com.kh.project.admin.service;

import java.util.List;

import com.kh.project.admin.vo.AdminMs;
import com.kh.project.board.vo.AlertPost;
import com.kh.project.board.vo.Board;
import com.kh.project.board.vo.Criteria;
import com.kh.project.member.vo.Member;

public interface AdminService {
	
	// 멤버쉽 조회
	public List<AdminMs> selectAdmin() throws Exception;
	
	// 멤버쉽 삭제
	public int deleteAdminMs (int mshipSeq) throws Exception;

	//게시글 관리
	public List<Board> selectPosts(Criteria cri) throws Exception;
	
	//신고회원 총 인원수
	public int allCountAlertMember() throws Exception;
	
	//신고회원 목록 조회
	public List<Member> selectListAlertMember() throws Exception;

	// 멤버십 삭제
	public int deleteMembership(String mshipSeq) throws Exception;
}
