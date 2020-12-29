package com.kh.ITWorks.email.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.common.template.Pagination;
import com.kh.ITWorks.email.model.dto.EmailAttachSelect;
import com.kh.ITWorks.email.model.dto.EmailSelect;
import com.kh.ITWorks.email.model.service.EmailService;
import com.kh.ITWorks.email.model.vo.Email;

@Controller
public class EmailController {
	
	@Autowired
	private EmailService emService;
	
	@RequestMapping("list.em")
	public String selectEmailList() {
		return "email/emailListView";
	}
	
	@RequestMapping("listFrom.em")
	public String selectEmailFromList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String email, Model model) {
		
		int listCount = emService.selectEmailFromListCount(email);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
		ArrayList<EmailSelect> list = emService.selectEmailFromList(pi, email);
		
		// 이메일이 존재 한다면
		if(!list.isEmpty()) {
			// 이메일 받는사람 메일주소 리스트 가져오기
			for(EmailSelect li : list) {
				
				// 받는사람이메일 주소
				ArrayList<String> listRec = emService.selectEmailFromListRec(li.getEmNo());
				// for문으로 해당 보낸메일 받은사람들 조회해서 문자열로 더해줌
				String recs = "";
				for(String rec : listRec) {
					recs += rec+"<br>";
				}
				// 해당 보낸메일에 더한 문자열을 추가해줌
				li.setEmTo(recs);
				
				// 첨부파일 여부
				int count = emService.selectEmailFromListAttCount(li.getEmNo());
				li.setAtt(count);
			}	
		}
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("title", "보낸메일함");
		return "email/emailFromListView";
	}
	
	@RequestMapping("listTo.em")
	public String selectEmailToList(String email, Model model) {
		
		int listCount = emService.selectEmailToListCount(email);
		
		System.out.println(listCount);
		
		return "email/emailToListView";
	}
	
	
	@RequestMapping("detailFrom.em")
	public String selectEmailFromDetail(int emNo, Model model) {
		
		EmailSelect em = emService.selectEmailFromDetail(emNo);
		
		if(em == null) {
			model.addAttribute("errorMsg", "존재하지 않거나 삭제된 이메일입니다.");
			return "common/errorPage";
		}else {
			
			// 받은사람 이메일 조회
			ArrayList<String> listRec = emService.selectEmailFromListRec(emNo);
			String res = "";
			for(String re : listRec) {
				res += re+"<br>";
			}
			em.setEmTo(res);
			
			// 첨부파일 리스트 조회
			ArrayList<EmailAttachSelect> listAtt = emService.selectEmailFromListAtt(emNo);
			
			model.addAttribute("listAtt",listAtt);
			model.addAttribute("em",em);
			return "email/emailFromDetailView";
		}
	}
	

	
	
	
}
