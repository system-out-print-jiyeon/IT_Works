package com.kh.ITWorks.attendance.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ITWorks.attendance.model.dao.AttendanceDao;
import com.kh.ITWorks.member.model.vo.Member;


@Service
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AttendanceDao aDao;


	@Override
	public Member loginMember(Member m) {
		return aDao.loginMember(sqlSession, m);
	}

}
