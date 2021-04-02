package com.kh.project.admin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kh.project.admin.dao.AdminDao;
import com.kh.project.admin.vo.AdminMs;
	
	@Service("adminService")
	public class AdminServiceImpl implements AdminService {

		@Resource(name="adminDao")
		private AdminDao adminDao;

		@Override
		public List<AdminMs> selectAdmin() throws Exception {
			return adminDao.selectAdminMs();
		}

		
}
	
	