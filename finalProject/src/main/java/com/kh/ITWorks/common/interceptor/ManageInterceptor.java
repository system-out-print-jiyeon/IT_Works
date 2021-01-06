package com.kh.ITWorks.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.ITWorks.member.model.vo.Member;

public class ManageInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		// 1차적으로 부서가 인사과가 맞는지 검사
		if(loginUser.getDeptCode().equals("D2")) { // 인사부서(D2)가 맞다면....
			// 2차적으로 직급검사 (대리이상 J2~~)
			System.out.println(loginUser.getDeptCode());
			if(loginUser.getJobCode().equals("J0") || loginUser.getJobCode().equals("J1")) {
				System.out.println(loginUser.getJobCode());
				session.setAttribute("alertMsg", "대리 이상의 직급만 이용가능한 서비스입니다.");
				response.sendRedirect(request.getContextPath()+"/manageList.ma");
				
				return false;
			}else {
				return true;
			}
		}else {
			session.setAttribute("alertMsg", "권한이 없습니다.(인사-대리 직급 이상 접근가능!!)");
			response.sendRedirect(request.getContextPath()+"/manageList.ma");
			
			return false;
		}
	}
}
