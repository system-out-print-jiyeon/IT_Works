package com.kh.ITWorks.approval.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ITWorks.approval.model.service.ApprovalService;
import com.kh.ITWorks.member.model.vo.Member;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService appService;

	@RequestMapping("approval.me")
	public String ApprovalPage(Model model, Member m) {
		
		int businessCount = appService.businessCount();
		int personnelCount = appService.personnelCount();
		int accountingCount = appService.accountingCount();
		int developerCount = appService.developerCount();
		int planningCount = appService.planningCount();

		ArrayList<Member> businessList = appService.businessList(m);
		ArrayList<Member> personnelList = appService.personnelList(m);
		ArrayList<Member> accountingList = appService.accountingList(m);
		ArrayList<Member> developerList = appService.developerList(m);
		ArrayList<Member> planningList = appService.planningList(m);
		
		model.addAttribute("bCount", businessCount);
		model.addAttribute("pCount", personnelCount);
		model.addAttribute("aCount", accountingCount);
		model.addAttribute("dCount", developerCount);
		model.addAttribute("plCount", planningCount);
		
		model.addAttribute("bList", businessList);
		model.addAttribute("pList", personnelList);
		model.addAttribute("aList", accountingList);
		model.addAttribute("dList", developerList);
		model.addAttribute("plList", planningList);
		
		
		return "approval/approvalEnrollForm";

	}

	@RequestMapping("approval.do")
	public String ApprovalList() {

		return "approval/approvalListView";

	}

	/**
	 * 왼쪽 상단 로고 클릭시 메인페이지 이동
	 */
	@RequestMapping("main.me")
	public String returnMain() {

		return "mainPage2";
	}

	/**
	 * 
	 * 문서 종류 선택시 에디터적용
	 */
	@RequestMapping("docList.me")
	@ResponseBody
	public ModelAndView selectFormList(ModelAndView mv, String selectoption) {

		if ("1".equals(selectoption)) {

			mv.setViewName("approval/approvalForms/outgoingsEnrollForm");
			
		} else if ("4".equals(selectoption)) {

			mv.setViewName("approval/approvalForms/consultDraftForm");
			
		} else if ("3".equals(selectoption)) {

			mv.setViewName("approval/approvalForms/projectReportForm");
			
		} else if ("2".equals(selectoption)) {

			mv.setViewName("approval/approvalForms/documentsRequestEnrollForm");
			
		}

		return mv;

	}
	
	

}
