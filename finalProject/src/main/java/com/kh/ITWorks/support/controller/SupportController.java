package com.kh.ITWorks.support.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.common.template.Pagination;
import com.kh.ITWorks.support.model.service.SupportService;
import com.kh.ITWorks.support.model.vo.WorkSupport;

@Controller
public class SupportController {
	
	@Autowired
	private SupportService ss;
	
	
	@RequestMapping("list.sp")
	public String supportListView(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model m) {
		
		int listCount = ss.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<WorkSupport> list = ss.selectListWorkSupport(pi);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		
		return "subbportBoard/supportListView";
		
	}
	
	

}
