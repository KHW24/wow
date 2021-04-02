package com.kh.project.admin.service;

import java.util.List;

import com.kh.project.admin.vo.AdminMs;

public interface AdminService {
	
	public List<AdminMs> selectAdmin() throws Exception;

}
