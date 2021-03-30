package com.kh.project.membership.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.project.membership.dao.MshipdataDao;
import com.kh.project.membership.vo.Mshipdata;

public class MshipdataController extends HttpServlet{
	
	public MshipdataController() {
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		MshipdataDao db = new MshipdataDao();
		List<Mshipdata> vo = null;
					
				try {
					vo = db.selectid();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 
			 req.setAttribute("list", vo);
	
		RequestDispatcher rd = req.getRequestDispatcher("/result.jsp");
		rd.forward(req, resp);
	}	
}