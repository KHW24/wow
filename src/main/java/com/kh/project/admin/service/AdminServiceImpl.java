package com.kh.project.admin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kh.project.admin.dao.AdminDao;
import com.kh.project.admin.vo.AdminMs;
import com.kh.project.board.vo.AlertPost;
import com.kh.project.board.vo.Board;
import com.kh.project.board.vo.Criteria;
import com.kh.project.member.vo.Member;
	
	@Service("adminService")
	public class AdminServiceImpl implements AdminService {

		@Resource(name="adminDao")
		private AdminDao adminDao;
		
		// 멤버쉽 조회
		@Override
		public List<AdminMs> selectAdmin() throws Exception {
			return adminDao.selectAdminMs();
		}

		// 멤버쉽 다중 삭제
		@Override
		public int deleteAdminMs(int mshipSeq) throws Exception {
			return adminDao.deleteAdminMs(mshipSeq);
		}

		//게시글 관리
		@Override
		public List<Board> selectPosts(Criteria cri) throws Exception {
			return adminDao.selectPosts(cri);
		}

		//신고회원 총 인원수
		@Override
		public int allCountAlertMember() throws Exception {
			return adminDao.allCountAlertMember();
		}

		//신고회원 목록조회
		@Override
		public List<Member> selectListAlertMember() throws Exception {
			return adminDao.selectListAlertMember();
		}

		// 멤버십 삭제
		public int deleteMembership(String mshipSeq) throws Exception{
			return adminDao.deleteMembership(mshipSeq);
		}
				

		
}
	
	