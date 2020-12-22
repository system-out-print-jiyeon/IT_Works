package com.kh.ITWorks.attendance.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ITWorks.attendance.model.service.AttendanceService;
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
			mv.setViewName("redirect:/"); /*여기 메인페이지로 바꾸기*/

		}else {
			mv.addObject("errorMsg", "로그인 실패! 다시 시도해주세요");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	@RequestMapping("logout.at")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/"; /*첫 로그인페이지로 가기*/
	}
	
	
	@RequestMapping("searchIdForm.at")
	public ModelAndView searchIdForm(ModelAndView mv) {
		mv.setViewName("attendance/searchIdForm");
		return mv;
	}
	
	@RequestMapping("searchId.at")
	public String searchId(Member m, HttpSession session, Model model) {
		String searchId = aService.searchId(m);
		
		if(searchId.equals("")) {
			return "attendance/searchIdFailed";
			
		}else {
			return "attendance/searchIdSuccess";
		}
		
	}
	
	
	

	
}
