package com.kh.ITWorks.calendar.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ITWorks.calendar.model.dao.CalendarDao;
import com.kh.ITWorks.calendar.model.vo.Calendar;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CalendarDao caDao;
	
	// 개인일정 조회
	@Override
	public ArrayList<Calendar> selectCalendarList(int memNo){
		return caDao.selectCalendarList(sqlSession, memNo);
	}
	
	// 부서일정 조회
	@Override
	public ArrayList<Calendar> selectCalendarDeptList(String deptName){
		return caDao.selectCalendarDeptList(sqlSession, deptName);
	}
	
	// 사내일정 조회
	@Override
	public ArrayList<Calendar> selectCalendarCompList(){
		return caDao.selectCalendarCompList(sqlSession);
	}
	
	// 일정 등록
	@Override
	public int insertCalendar(Calendar ca) {
		return caDao.insertCalendar(sqlSession, ca);
	}
}
