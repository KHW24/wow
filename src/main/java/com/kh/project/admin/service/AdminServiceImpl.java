package com.kh.project.admin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kh.project.admin.dao.AdminDao;
import com.kh.project.admin.vo.Admin;
	
	@Service("adminService")
	public class AdminServiceImpl implements AdminService {

		@Resource(name="adminDao")
		private AdminDao adminDao;

		@Override
		public List<Admin> selectAdmin() throws Exception {
			return adminDao.selectAdmin();
		}

		
}
	
	