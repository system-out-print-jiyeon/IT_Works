package com.kh.ITWorks.attendance.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ITWorks.attendance.model.vo.BusinessTrip;
import com.kh.ITWorks.member.model.vo.Member;


@Repository
public class AttendanceDao {
	
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.selectOne("attendanceMapper.loginMember", m);
		
	}
	
	public Member searchId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("attendanceMapper.searchId", m);
	}

	public Member searchPwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("attendanceMapper.searchPwd", m);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("attendanceMapper.updatePwd", m);
	}
	
	//public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
	//	return sqlSession.selectOne("attendanceMapper.selectMember", m);
	//}

	public int insertBusiness(SqlSessionTemplate sqlSession, BusinessTrip bt) {
		return sqlSession.insert("attendanceMapper.insertBusiness", bt);
	}
	
	
	
}
