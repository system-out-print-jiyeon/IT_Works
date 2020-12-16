package com.kh.ITWorks.member.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.common.template.Pagination;
import com.kh.ITWorks.member.model.service.MemberService;
import com.kh.ITWorks.member.model.vo.Member;

@Controller
public class MemberController {
	
	
	@Autowired
	private MemberService mService;
	
	
	@RequestMapping("manageList.ma")
	public String selectManageList(@RequestParam(value="currentPage", defaultValue="1")int currentPage, Model model) {
		
		int listCount = mService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Member> list = mService.selectManageList(pi);
		
		model.addAttribute("count", listCount);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "member/manage_list";
	}
	
	@RequestMapping("orgTree.ma")
	public String orgTree() {
		
		return "member/manage_orgTree";
	}
	
	@RequestMapping("listManage.ma")
	public String listManage() {
		
		return "member/manage_manageList";
	}
	
	@RequestMapping("enroll.ma")
	public String enrollForm() {
		return "member/manage_enrollForm";
	}
	
	@RequestMapping("update.ma")
	public String updateForm() {
		return "member/manage_updateForm";
	}
}
