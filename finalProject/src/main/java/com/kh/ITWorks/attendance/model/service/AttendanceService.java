package com.kh.ITWorks.attendance.model.service;

import java.util.ArrayList;

import com.kh.ITWorks.attendance.model.vo.BusinessTrip;
import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.member.model.vo.Member;

public interface AttendanceService {
	
	// 로그인용 서비스
	Member loginMember(Member m);
	
	// 아이디 찾기
	Member searchId(Member m);
	
	// 비밀번호 찾기
	Member searchPwd(Member m);
	
	// 비밀번호 수정
	int updateMember(Member m);
	
	
	// *근태관리*
	// 출장신청 리스트 조회
	int selectListCount();
	ArrayList<BusinessTrip> selectBusinessTripList(PageInfo pi);
	
	// 출장신청 제출하기
	int insertBusiness(BusinessTrip bt);
	
		

}
