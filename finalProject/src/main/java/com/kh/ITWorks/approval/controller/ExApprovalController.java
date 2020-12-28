package com.kh.ITWorks.approval.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ITWorks.approval.model.vo.Outgoings;

@Controller
public class ExApprovalController {
	
	@RequestMapping("detail.ap")
	public String ApprovalDetail() {
		
		return "approval/approvalDetailView";
		
	}
	
	@RequestMapping("outgoingsInsert.ap")
	public void insertOutgoingsList(Outgoings o) {
		
		ArrayList<Outgoings> oList = o.getOutgoingsList();
		
	}

}
