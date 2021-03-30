package com.kh.project.membership.dao;

import org.springframework.stereotype.Repository;

import com.kh.project.membership.vo.Mshipdata;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MshipdataDao {

	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:ORCL";  
	String sql = "select MSHIP_SEQ, MSHIP_START, MSHIP_YN, MSHIP_END, MSHIP_GRADE, ID from MSHIPDATA ";

	Connection conn;

	PreparedStatement pstmt;

	ResultSet rs;
	List<Mshipdata> vo = new ArrayList<>();
	Mshipdata vo1;
	
	@SuppressWarnings("unchecked")
	public List<Mshipdata> selectid() throws ClassNotFoundException, SQLException {
			
		 Class.forName(driver);

		    // ② 데이터베이스 connection 
		    conn=DriverManager.getConnection(url,"scott","tiger"); 
		    // ③ 쿼리(sql)문장을 실행하기 위한 객체 생성
		  
		    pstmt=conn.prepareStatement(sql);
		    // ④ 쿼리 실행

		    rs=pstmt.executeQuery();
		    // ⑤ 쿼리 실행의 결과값(int, ResultSet) 사용
		   
		    while(rs.next()){
		    	
		    	vo1 = new Mshipdata();
		    	int mshipGrade = 0;
				vo1.setMshipGrade(mshipGrade);
		    	Object mshipDate = null;
				vo1.setMshipDate(mshipDate);	
		    	Object mshipPrice = null;
				vo1.setMshipPrice(mshipPrice);
		    	
		    	vo.add(vo1);
		    }
		   
		    rs.close();
		    pstmt.close();
		    conn.close();
		    
			return vo;
	}
}
