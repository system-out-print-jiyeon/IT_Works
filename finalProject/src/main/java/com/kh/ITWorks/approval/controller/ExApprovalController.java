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
	
	public void insertApprovalDocument(ApprovalDocument ad, Attachment a, ApprovalLine al, Referer r, Outgoings o, DocumentsRequest dr,HttpSession session, Model model) {
		
		int result1 = aService.insertApprovalDocument(ad);
		int result2 = aService.insertApprovalAttachment(a);
		int result3 = aService.insertApprovalLine(al);
		int result4 = aService.insertApprovalReferer(r);
		
		int insertResult = result1 * result2 * result3 * result4;
		
		if (insertResult > 0) {	// 입력성공
			
			if (ad.getDocForm() == 1) {			// 지출결의서
				int outgoingsResult1 = aService.insertOutgoings(o);
				ArrayList<OutgoingsList> oList = o.getOutgoingsList();
				
				int outgoingsResult2 = aService.insertOutgoingsList(oList);
				
				if (outgoingsResult1 * outgoingsResult2 > 0) {
					
				} else {
					
				}
			} else if (ad.getDocForm() == 2) {	// 문서발급요청서
				ArrayList<DocumentsRequest> drList = dr.getDocreqList();
				
				int docreqResult = aService.insertDocumentsRequest(drList);
				
				if (docreqResult > 0) {
					
				} else {
					
				}
			} else if (ad.getDocForm() == 3) {	// 프로젝트업무보고서
				
			} else if (ad.getDocForm() == 4) {	// 품의서
				
			}
			
		} else {	// 입력실패
			
		}
		
	}
	
	// 결재문서상세
	public void ApprovalDocumentDetail(ApprovalDocument ad, Attachment a, ApprovalLine al, Referer r, HttpSession session, Model model) {
		
		
		
	}

}
