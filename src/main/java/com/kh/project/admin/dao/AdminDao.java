package com.kh.project.admin.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kh.project.admin.vo.Admin;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String Namespace="com.kh.project.admin.vo.Admin";
	
	public List<Admin> selectAdmin() throws Exception{
		//Namespace+
		return sqlSession.selectList("Admin.selectAdmin");
	}

	
}
