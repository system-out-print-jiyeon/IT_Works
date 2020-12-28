package com.kh.ITWorks.approval.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ITWorks.approval.model.service.ApprovalService;
import com.kh.ITWorks.approval.model.vo.ApprovalDocument;
import com.kh.ITWorks.approval.model.vo.ApprovalLine;
import com.kh.ITWorks.approval.model.vo.Attachment;
import com.kh.ITWorks.approval.model.vo.DocumentsRequest;
import com.kh.ITWorks.approval.model.vo.Outgoings;
import com.kh.ITWorks.approval.model.vo.OutgoingsList;
import com.kh.ITWorks.approval.model.vo.Referer;

@Controller
public class ExApprovalController {
	
	@Autowired
	private ApprovalService aService;
	
	@RequestMapping("detail.ap")
	public String ApprovalDetail() {
		
		return "approval/approvalDetailView";
		
	}
	
	public void insertApprovalDocument(ApprovalDocument ad, Attachment a, ApprovalLine al, Referer r, HttpSession session, Model model) {
		
		int result1 = aService.insertApprovalDocument(ad);
		int result2 = aService.insertApprovalAttachment(a);
		int result3 = aService.insertApprovalLine(al);
		int result4 = aService.insertApprovalReferer(r);
		
		if (result1 * result2 * result3 * result4 > 0) {	// 입력성공
			
		} else {	// 입력실패
			
		}
		
	}
	
	public void insertApprovalDocument() {
		
	}
	
	// 지출결의서insert
	@RequestMapping("outgoingsInsert.ap")
	public String insertOutgoingsList(Outgoings o, HttpSession session, Model model) {
		
		int result1 = aService.insertOutgoings(o);
		ArrayList<OutgoingsList> oList = o.getOutgoingsList();
		
		int result2 = aService.insertOutgoingsList(oList);
		
		if (result1 * result2 > 0) {
			return "";
		} else {
			model.addAttribute("errorMsg", "잘못된 문서 입력!");
			return "common/errorPage.jsp";
		}
		
	}
	
	// 문서발급요청서insert
	public String insertDocumentsRequest(DocumentsRequest dr, HttpSession session, Model model) {
		
		ArrayList<DocumentsRequest> drList = dr.getDocreqList();
		int result = aService.insertDocumentsRequest(drList);
		
		return "";
		
	}
	
	// 결재문서상세
	public void ApprovalDocumentDetail(ApprovalDocument ad, Attachment a, ApprovalLine al, Referer r, HttpSession session, Model model) {
		
		
		
	}

}
