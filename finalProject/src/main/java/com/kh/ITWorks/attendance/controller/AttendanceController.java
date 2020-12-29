package com.kh.ITWorks.attendance.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ITWorks.attendance.model.service.AttendanceService;
import com.kh.ITWorks.attendance.model.vo.BusinessTrip;
import com.kh.ITWorks.member.model.vo.Member;

@Controller
public class AttendanceController {

	@Autowired
	private AttendanceService aService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@RequestMapping("login.at")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = aService.loginMember(m);  
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemPwd(),(loginUser.getMemPwd()))) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("mainPage2"); 

		}else {
			mv.addObject("errorMsg", "로그인 실패! 다시 시도해주세요");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	@RequestMapping("logout.at")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "mainPage";
	}
	
	@RequestMapping("searchIdForm.at")
	public ModelAndView searchIdForm(ModelAndView mv) {
		mv.setViewName("attendance/searchIdForm");
		return mv;
	}
	
	@RequestMapping("searchId.at")
	public ModelAndView searchId(Member m, HttpSession session, ModelAndView mv) {
		Member searchId = aService.searchId(m);
		
		if(searchId != null) {
			session.setAttribute("searchId", searchId);
			mv.setViewName("attendance/searchIdSuccess");
		}else {
			mv.setViewName("attendance/searchIdFailed");
		}
		return mv;
	}
	
	@RequestMapping("searchPwdForm.at")
	public ModelAndView searchPwdForm(ModelAndView mv) {
		mv.setViewName("attendance/searchPwdForm");
		return mv;
	}
	
	@RequestMapping("searchPwd.at")
	public ModelAndView searchPwd(Member m, HttpSession session, ModelAndView mv) {
		Member searchPwd = aService.searchPwd(m);
		
		if(searchPwd != null) {
			session.setAttribute("searchPwd", searchPwd);
			mv.setViewName("attendance/resetPwdForm");
		}else {
			mv.setViewName("attendance/searchPwdFailed");
		}
		return mv;
	}
	
	
	@RequestMapping("update.at")
	public String updateMember(Member m, Model model, HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
		m.setMemPwd(encPwd);
		
		int result = aService.updateMember(m);
		
		if(result > 0) {
			session.setAttribute("searchPwd", aService.loginMember(m));
			
			return "attendance/resetPwdSuccess";
			
		}else { 
			
			model.addAttribute("errorMsg", "회원정보 수정 실패!");
			return "common/errorPage";
			
		}
	}

	
	@RequestMapping("insertForm.bt")
	public ModelAndView insertBusinessForm(ModelAndView mv) {
		mv.setViewName("attendance/submitBusinessTrip");
		return mv;
	}
	
	
	@RequestMapping("insert.bt")
	public String insertBoard(BusinessTrip bt, HttpSession session,
							Model model) {
		
		int result = aService.insertBusiness(bt);
		
		if(result > 0) { // 성공
			session.setAttribute("alertMsg", "출장신청이 성공적으로 등록되었습니다.");
			return "redirect:insert.bt"; // 나중에 근태첫페이지로 바꾸기
		}else { // 실패
			model.addAttribute("errorMsg", "출장신청 등록에 실패했습니다. 다시 시도해주세요.");
			return "common/errorPage";
		}
		
	}
	
	
	
}
