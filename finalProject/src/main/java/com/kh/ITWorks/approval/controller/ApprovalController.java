package com.kh.ITWorks.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ApprovalController {

	@RequestMapping("approval.me")
	public String ApprovalPage() {
		
		return "approval/approvalEnrollForm";
		
	}
	
	@RequestMapping("approval.do")
	public String ApprovalList() {
		
		return "approval/approvalListView";
		
	}
	
	
	
}
