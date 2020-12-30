package com.kh.ITWorks.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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

	/**
	 *  왼쪽 상단 로고 클릭시 메인페이지 이동
	 */
	@RequestMapping("main.me")
	public String returnMain() {

		return "mainPage2";
	}

	/**
	 * 
	 *   문서 종류 선택시 에디터적용
	 */
	@RequestMapping("docList.me")
	@ResponseBody
	public ModelAndView selectFormList(ModelAndView mv, String selectoption) {
		
		
		
		System.out.println(selectoption);
		if ("outgoingEnrollForm".equals(selectoption)) {
			
			mv.setViewName("approval/approvalForms/outgoingsEnrollForm");
		} else if ("consultDraftForm".equals(selectoption)) {

			mv.setViewName("approval/approvalForms/consultDraftForm");
		} else if ("projectReportForm".equals(selectoption)) {

			mv.setViewName("approval/approvalForms/projectReportForm");
		} else if ("documentsRequestEnrollForm".equals(selectoption)) {

			mv.setViewName("approval/approvalForms/documentsRequestEnrollForm");
		} 

		return mv;

	}

}
