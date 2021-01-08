package com.kh.ITWorks.calendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ITWorks.calendar.model.vo.Calendar;

@Repository
public class CalendarDao {
	
	// 개인일정 조회
	public ArrayList<Calendar> selectCalendarList(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("calendarMapper.selectCalendarList", memNo);
	}
	
	// 부서일정 조회
	public ArrayList<Calendar> selectCalendarDeptList(SqlSessionTemplate sqlSession, String deptName){
		return (ArrayList)sqlSession.selectList("calendarMapper.selectCalendarDeptList", deptName);
	}
	
	// 사내일정 조회
	public ArrayList<Calendar> selectCalendarCompList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("calendarMapper.selectCalendarCompList");
	}
	
	// 일정 등록
	public int insertCalendar(SqlSessionTemplate sqlSession, Calendar ca) {
		return sqlSession.insert("calendarMapper.insertCalendar", ca);
	}
	
	// 일정 삭제
	public int deleteCalendar(SqlSessionTemplate sqlSession, Calendar ca) {
		return sqlSession.update("calendarMapper.deleteCalendar", ca);
	}
	
	// 일정 삭제
	public int updateCalendar(SqlSessionTemplate sqlSession, Calendar ca) {
		return sqlSession.update("calendarMapper.updateCalendar", ca);
	}
}
