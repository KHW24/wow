package com.kh.project.admin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kh.project.admin.dao.AdminDao;
import com.kh.project.admin.vo.AdminMs;
import com.kh.project.board.vo.AlertPost;
import com.kh.project.member.vo.Member;
	
	@Service("adminService")
	public class AdminServiceImpl implements AdminService {

		@Resource(name="adminDao")
		private AdminDao adminDao;

		@Override
		public List<AdminMs> selectAdmin() throws Exception {
			return adminDao.selectAdminMs();
		}

		//신고게시글 조회
		@Override
		public List<AlertPost> selectAlert() throws Exception {
			return adminDao.selectAlert();
		}

		//신고내역 삭제
		@Override
		public void deleteAlert(int alertSeq) throws Exception {
			adminDao.deleteAlert(alertSeq);
		}


		
}
	
	