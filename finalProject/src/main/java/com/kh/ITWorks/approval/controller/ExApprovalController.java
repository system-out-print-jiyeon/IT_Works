package com.kh.ITWorks.approval.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.ITWorks.approval.model.service.ApprovalService;
import com.kh.ITWorks.approval.model.vo.ApprovalDocument;
import com.kh.ITWorks.approval.model.vo.ApprovalLine;
import com.kh.ITWorks.approval.model.vo.Attachment;
import com.kh.ITWorks.approval.model.vo.Opinion;
import com.kh.ITWorks.approval.model.vo.Referer;
import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.common.template.Pagination;

@Controller
public class ExApprovalController {
	
	@Autowired
	private ApprovalService aService;
	
	@RequestMapping("list.ap")
	public String selectApprovalList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
									 ApprovalDocument ad,
									 HttpSession session, Model model) {
		int listCount = aService.selectListCount(ad);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
		ArrayList<ApprovalDocument> alist = aService.selectApprovalList(pi, ad);
		
		model.addAttribute("pi", pi);
		model.addAttribute("alist", alist);
		
		return "approval/approvalListView";
	}
	
	@RequestMapping("allist.ap")
	public String selectApprovalLineList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
		                                 ApprovalDocument ad,
		                                 HttpSession session, Model model) {
		int listCount = aService.selectLineListCount(ad);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
		ArrayList<ApprovalDocument> alist = aService.selectApprovalLineList(pi, ad);
		
		model.addAttribute("pi", pi);
		model.addAttribute("alist", alist);
		
		return "approval/approvalListView";

	}
	
	@RequestMapping("rlist.ap")
	public String selectRefererList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
		                                 ApprovalDocument ad,
		                                 HttpSession session, Model model) {
		int listCount = aService.selectRefererListCount(ad);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
		ArrayList<ApprovalDocument> alist = aService.selectRefererList(pi, ad);
		
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
	public String insertApprovalDocument(ApprovalDocument ad, Attachment a, ApprovalLine al, Referer r,
			                           HttpSession session, Model model, MultipartFile upfile) {
		int documentResult = aService.insertApprovalDocument(ad);

//		if (!upfile.getOriginalFilename().equals("")) {
//			a.setAttOriginName(upfile.getOriginalFilename());
//			a.setAttChangeName(saveFile(session, upfile));
//			a.setAttPath("resources/upfiles/");
//		}
		
//		int attachmentResult= aService.insertApprovalAttachment(a);
		
//		ArrayList<ApprovalLine> apLineList = al.getApLineList();
//		int apLineResult = aService.insertApprovalLine(apLineList);
		
//		ArrayList<Referer> refererList = r.getRefererList();
//		int refererResult = aService.insertApprovalReferer(refererList);
		
		int insertResult = documentResult /** apLineResult * refererResult */;
		
		if (insertResult > 0) {	// 입력성공
			return "approval.me";
		} else {	// 입력실패
			session.setAttribute("errorMsg", "입력 실패!!");
			return "common/errorPage";
		}
		
	}
	
	public String saveFile(HttpSession session, MultipartFile upfile) {
		
		String savePath = session.getServletContext().getRealPath("/resources/upFiles/");
		
		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}

}
