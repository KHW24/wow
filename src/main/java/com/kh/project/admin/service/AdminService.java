package com.kh.project.admin.service;

import java.util.List;

import com.kh.project.admin.vo.AdminMs;
import com.kh.project.board.vo.AlertPost;
import com.kh.project.member.vo.Member;

public interface AdminService {
	
	// 멤버쉽 조회
	public List<AdminMs> selectAdmin() throws Exception;
	
	// 멤버쉽 삭제
	public int deleteAdminMs (int mshipSeq) throws Exception;

	//신고게시글 조회
	public List<AlertPost> selectAlert() throws Exception;
	
	//신고내역삭제
	public void deleteAlert(int alertSeq) throws Exception;

}
