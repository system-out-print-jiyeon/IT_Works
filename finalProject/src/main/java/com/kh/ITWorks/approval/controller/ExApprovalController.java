package com.kh.ITWorks.approval.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ITWorks.approval.model.service.ApprovalService;
import com.kh.ITWorks.approval.model.vo.Outgoings;

@Controller
public class ExApprovalController {
	
	@Autowired
	private ApprovalService aService;
	
	@RequestMapping("detail.ap")
	public String ApprovalDetail() {
		
		return "approval/approvalDetailView";
		
	}
	
	@RequestMapping("outgoingsInsert.ap")
	public void insertOutgoingsList(Outgoings o) {
		
		int result = aService.insertOutgoings(o);
		ArrayList<Outgoings> oList = o.getOutgoingsList();
		
		int result1 = aService.insertOutgoingsList(oList);
		
		if (result > 0) {
			
		} else {
			
		}
		
	}

}
