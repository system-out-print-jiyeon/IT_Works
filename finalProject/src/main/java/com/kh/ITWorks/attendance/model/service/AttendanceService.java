package com.kh.ITWorks.attendance.model.service;

import com.kh.ITWorks.member.model.vo.Member;

public interface AttendanceService {
	
	// 로그인용 서비스
	Member loginMember(Member m);
	
	// 아이디 찾기
	Member searchId(Member m);
	
	// 비밀번호 찾기
	Member searchPwd(Member m);
	

}
