package com.kh.ITWorks.approval.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

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
import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.common.template.Pagination;

@Controller
public class ExApprovalController {
	
	@Autowired
	private ApprovalService aService;
	
	@RequestMapping("list.ap")
	public String selectApprovalList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
									 @RequestParam(value = "memNo") int memNo,
									 HttpSession session, Model model) {
		int listCount = aService.selectListCount(memNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 15, 5);
		ArrayList<ApprovalDocument> alist = aService.selectApprovalList(pi, memNo);
		
		model.addAttribute("pi", pi);
		model.addAttribute("alist", alist);
		
		return "approval/approvalListView";
	}
	
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
			return "redirect:detail.ap?docNo=" + al.getDocNo();
		} else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("opinion.ap")
	public String insertOpinion(Opinion o, HttpSession session, Model model) {
		int result = aService.insertOpinion(o);
		
		if (result > 0) {
			return "redirect:detail.ap?docNo=" + o.getDocNo();
		} else {
			session.setAttribute("alertMsg", "다시 입력해주세요");
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
