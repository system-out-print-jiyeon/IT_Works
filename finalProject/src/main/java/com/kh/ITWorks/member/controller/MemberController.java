package com.kh.ITWorks.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.common.template.Pagination;
import com.kh.ITWorks.member.model.service.MemberService;
import com.kh.ITWorks.member.model.vo.Member;

@Controller
public class MemberController {
	
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;
	
	
	@RequestMapping("manageList.ma")
	public String selectManageList(@RequestParam(value="currentPage", defaultValue="1")int currentPage, Model model) {
		
		int listCount = mService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Member> list = mService.selectManageList(pi);
		
		model.addAttribute("count", listCount);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "member/manage_list";
	}
	
	@RequestMapping("detail.ma")
	public String detailView(int memNo, Model model) {
		
		Member m = mService.detailView(memNo);
		
		model.addAttribute("m", m);
		
		System.out.println(m);
		
		return "member/manage_detailForm";
	}
	
	@RequestMapping("orgTree.ma")
	public String orgTree() {
		
		return "member/manage_orgTree";
	}
	
	@RequestMapping("listManage.ma")
	public String listManage(@RequestParam(value="currentPage", defaultValue="1")int currentPage, Model model) {
		
		int listCount = mService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Member> list = mService.selectManageList(pi);
		
		model.addAttribute("count", listCount);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "member/manage_manageList";
	}
	
	@RequestMapping("enrollForm.ma")
	public String enrollForm() {
		return "member/manage_enrollForm";
	}
	
	@RequestMapping("memberEnroll.ma")
	public String memberEnroll(Member m, Model model, HttpSession session) {
		//System.out.println(m);
		//System.out.println("암호화 전에 암호 체크용 - " + m.getMemPwd());
		
		String encPwd = pwdEncoder.encode(m.getMemPwd());
		System.out.println(encPwd);
		m.setMemPwd(encPwd);
		
		int result = mService.memberEnroll(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "회원가입 성공!");
			return "redirect:manageList.ma";
		}else {
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping("idCheck.ma")
	public String idCheck(String memId) {
		int count = mService.idCheck(memId);
		return String.valueOf(count);	
	}
	
	@RequestMapping("search.ma")
	public String searchList(@RequestParam(value="currentPage", defaultValue="1")int currentPage, 
												Model model, String selectList, String keyword) {
		System.out.println(selectList);
		System.out.println(keyword);
		
		int searchCount = mService.searchListCount(selectList,keyword);
		System.out.println("검색결과 갯수 : " + searchCount);
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 10, 10);
		ArrayList<Member> list = mService.selectSearch(selectList,keyword,pi);
		
		System.out.println(list);
		
		model.addAttribute("count", searchCount);
		model.addAttribute("list", list);
		
		// 검색기능 수정중 2020.12.24 ..ing
		
		return "member/manage_list";
	}
	
	@RequestMapping("update.ma")
	public String updateForm() {
		return "member/manage_updateForm";
	}
}
