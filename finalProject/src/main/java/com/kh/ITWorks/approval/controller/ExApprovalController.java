package com.kh.ITWorks.approval.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.ITWorks.approval.model.service.ApprovalService;
import com.kh.ITWorks.approval.model.vo.ApprovalDocument;
import com.kh.ITWorks.approval.model.vo.ApprovalLine;
import com.kh.ITWorks.approval.model.vo.Attachment;
import com.kh.ITWorks.approval.model.vo.DocumentsRequest;
import com.kh.ITWorks.approval.model.vo.Opinion;
import com.kh.ITWorks.approval.model.vo.Outgoings;
import com.kh.ITWorks.approval.model.vo.OutgoingsList;
import com.kh.ITWorks.approval.model.vo.Referer;

@Controller
public class ExApprovalController {
	
	@Autowired
	private ApprovalService aService;
	
	@RequestMapping("detail.ap")
	public String ApprovalDetail(int docNo, Model model) {
		
		ArrayList<ApprovalLine> aList = aService.selectApprovalLine(docNo);		// 결재문서 결재선
		ArrayList<Referer> rList = aService.selectReferer(docNo);				// 결재문서 참조자
		ApprovalDocument ad = aService.selectApprovalDocument(docNo);			// 결재문서 문서정보
		
		ArrayList<Attachment> attList = aService.selectAttachment(docNo);		// 결재문서 첨부파일
		ArrayList<Opinion> opList = aService.selectOpinion(docNo);				// 결재문서 의견
		
		if (!"".equals(ad)) {
			model.addAttribute("aList", aList);
			model.addAttribute("rList", rList);
			model.addAttribute("ad", ad);
			
			model.addAttribute("attList", attList);
			model.addAttribute("opList", opList);
			
			return "approval/approvalDetailView";
		} else {
			model.addAttribute("errorMsg", "잘못된 접근 입니다.");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("decision.ap")
	public String approvalDecision(ApprovalLine al, HttpSession session, Model model) {
		
		int result = aService.approvalDecision(al);
		
		if (result > 0) {
			return "approval/approvalDetailView";
		} else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("opinion.ap")
	public String insertOpinion(Opinion o, Model model) {
		System.out.println(o.getDocNo());
		System.out.println(o.getOpiContent());
		int result = aService.insertOpinion(o);
		
		if (result > 0) {
			return "redirect:detail.ap";
		} else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("insert.ap")
	public void insertApprovalDocument(ApprovalDocument ad, Attachment a, ApprovalLine al, Referer r, Outgoings o, DocumentsRequest dr,HttpSession session, Model model) {
		
		int docmentResult = aService.insertApprovalDocument(ad);
		
		int attachmentResult= aService.insertApprovalAttachment(a);
		
		ArrayList<ApprovalLine> apLineList = al.getApLineList();
		int apLineResult = aService.insertApprovalLine(apLineList);
		
		ArrayList<Referer> refererList = r.getRefererList();
		int refererResult = aService.insertApprovalReferer(refererList);
		
		int insertResult = docmentResult * apLineResult * refererResult;
		
		if (insertResult > 0) {	// 입력성공
						
		} else {	// 입력실패
						
		}
		
	}

}
