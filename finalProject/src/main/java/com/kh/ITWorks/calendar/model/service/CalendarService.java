package com.kh.ITWorks.calendar.model.service;

import java.util.ArrayList;

import com.kh.ITWorks.calendar.model.vo.Calendar;

public interface CalendarService {
	// 개인일정 조회
	ArrayList<Calendar> selectCalendarList(int memNo);
	// 부서일정 조회
	ArrayList<Calendar> selectCalendarDeptList(String deptName);
	// 사내일정 조회
	ArrayList<Calendar> selectCalendarCompList();
	
	// 일정 등록
	int insertCalendar(Calendar ca);
	
	// 일정 삭제
	int deleteCalendar(Calendar ca);
	
	// 일정 수정
	int updateCalendar(Calendar ca);
}
