package com.kh.ITWorks.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExApprovalController {
	
	@RequestMapping("detail.ap")
	public String ApprovalDetail() {
		
		return "approval/approvalDetailView";
		
	}

}
