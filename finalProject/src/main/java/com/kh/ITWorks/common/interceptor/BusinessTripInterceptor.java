package com.kh.ITWorks.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.ITWorks.member.model.vo.Member;


public class BusinessTripInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
	
		HttpSession session = request.getSession();
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		if(loginUser.getJobCode().equals("J0") || loginUser.getJobCode().equals("J1")) {
			
			session.setAttribute("alertMsg", "대리 이상의 직급만 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath()+"/list.bt");
			
			return false;
		}else {
		
			return true;			
		}
		
		
	}
	
	

}
