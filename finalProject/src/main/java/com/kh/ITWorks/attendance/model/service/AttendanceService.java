package com.kh.ITWorks.attendance.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.ITWorks.attendance.model.vo.AnnualLeave;
import com.kh.ITWorks.attendance.model.vo.BusinessTrip;
import com.kh.ITWorks.attendance.model.vo.WorkDay;
import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.member.model.vo.Member;

public interface AttendanceService {
	// *로그인*
	// 로그인용 서비스
	Member loginMember(Member m);
	
	// 아이디 찾기
	Member searchId(Member m);
	
	// 비밀번호 찾기
	Member searchPwd(Member m);
	
	// 비밀번호 수정
	int updateMember(Member m);
	
	
	// *근태관리*
	
	// 출장
	// 출장신청 리스트 조회
	int selectListCount();
	ArrayList<BusinessTrip> selectBusinessTripList(PageInfo pi);
	
	// 출장신청 제출하기
	int insertBusiness(BusinessTrip bt);
	
	// 출장 상세조회용 서비스
	int increaseCount(int btno);
	BusinessTrip selectBusinessTrip(int btno);
	
	// 출장 반려용 서비스
	int returnBusinessTrip(Map<String, Object> approval);
	
	// 출장 승인용 서비스
	int approvalBusinessTrip(Map<String, Object> approval);
	
	// 연차
	// 연차신청 리스트 조회
	int selectListCountAL();  
	ArrayList<AnnualLeave> selectAnnualLeaveList(PageInfo pi);
	
	// 연차신청 제출하기
	int insertAnnualLeave(AnnualLeave an);
	
	// 연차 상세조회용 서비스
	int increaseCountAL(int anno);
	AnnualLeave selectAnnualLeave(int anno);
	
	// 연차 반려용 서비스
	int returnAnnualLeave(Map<String, Object> approval);
	
	// 연차 승인용 서비스
	int approvalAnnualLeave(Map<String, Object> approval);
	int subtractAnnualLeave(int prno);
	
	
	
	
	
	// 출퇴근 등록
	int checkOnWork(WorkDay wd);
	int updateOnWork(Map<String, Object> updatewd);
	
	int checkLeaveWork(WorkDay wd);
	int updateLeaveWork(Map<String, Object> updatewd);
	
	// 연차신청 리스트 조회
	int selectListCountWD(int memNo);  
	ArrayList<WorkDay> selectWorkDayList(PageInfo pi, int memNo);
	
}
