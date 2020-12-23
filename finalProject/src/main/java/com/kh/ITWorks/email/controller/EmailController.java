package com.kh.ITWorks.email.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.common.template.Pagination;
import com.kh.ITWorks.email.model.dto.EmailSelect;
import com.kh.ITWorks.email.model.service.EmailService;
import com.kh.ITWorks.email.model.vo.Email;

@Controller
public class EmailController {
	
	@Autowired
	private EmailService emService;

	
	@RequestMapping("list.em")
	public String selectEmailList() {
		
		return "email/emailListView";
	}
	
	
	@RequestMapping("listFrom.em")
	public String selectEmailListTo(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String email, Model model) {
		
		int listCount = emService.selectEmailFromListCount(email);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
		ArrayList<EmailSelect> list = emService.selectEmailFromList(pi, email);

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("title", "보낸메일함");
		return "email/emailListView";
	}
	
	
}
