package com.kh.project.admin.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.kh.project.admin.service. AdminService;
import com.kh.project.admin.vo.Admin;

@Controller
	public class AdminController {

	@Autowired
	AdminService adminService;
	
	@RequestMapping(value="membership.do", method=RequestMethod.GET)
	public String AdminView(Locale locale, Model model) throws Exception{

//		Date date = new Date();
//        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//         
//        String formattedDate = dateFormat.format(date);
		
        List<Admin> adminList = adminService.selectAdmin();
		
        model.addAttribute("adminList", adminList);
		model.addAttribute("center", "../admin/membership.jsp");
			
		return "template/index";
	}
	
}

  
