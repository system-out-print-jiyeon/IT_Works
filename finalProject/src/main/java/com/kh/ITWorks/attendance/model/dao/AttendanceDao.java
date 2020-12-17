package com.kh.ITWorks.attendance.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ITWorks.member.model.vo.Member;


@Repository
public class AttendanceDao {
	
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.selectOne("attendanceMapper.loginMember", m);
		
	}
	


}
