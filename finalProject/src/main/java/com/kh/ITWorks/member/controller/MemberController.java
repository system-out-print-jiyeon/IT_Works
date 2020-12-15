package com.kh.ITWorks.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ITWorks.member.model.service.MemberService;

@Controller
public class MemberController {
	
	/*
	@Autowired
	private MemberService mService;
	 * */
	
	@RequestMapping("manageList.ma")
	public String selectManageList() {
		
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
