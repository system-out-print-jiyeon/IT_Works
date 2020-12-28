package com.kh.ITWorks.attendance.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ITWorks.attendance.model.dao.AttendanceDao;
import com.kh.ITWorks.attendance.model.vo.BusinessTrip;
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


	@Override
	public Member searchId(Member m) {
		return aDao.searchId(sqlSession, m);
	}


	@Override
	public Member searchPwd(Member m) {
		return aDao.searchPwd(sqlSession, m);
	}


	@Override
	public int updateMember(Member m) {
		return aDao.updateMember(sqlSession, m);
	}


	@Override
	public Member selectMember(Member m) {
		return aDao.selectMember(sqlSession, m);
	}


	@Override
	public int insertBusiness(BusinessTrip bt) {
		return aDao.insertBusiness(sqlSession, bt);
	}

}
