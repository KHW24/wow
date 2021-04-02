package com.kh.project.admin.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kh.project.admin.vo.AdminMs;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<AdminMs> selectAdminMs() throws Exception{
		return sqlSession.selectList("Admin.selectAdminMs");
	}

	
	
}
