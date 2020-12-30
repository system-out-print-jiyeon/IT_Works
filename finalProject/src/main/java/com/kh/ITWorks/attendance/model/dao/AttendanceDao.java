package com.kh.ITWorks.attendance.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ITWorks.attendance.model.vo.BusinessTrip;
import com.kh.ITWorks.common.model.vo.PageInfo;
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
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("attendanceMapper.selectListCount");
	}
	
	
	public ArrayList<BusinessTrip> selectBusinessTripList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectBusinessTripList", null, rowBounds);
	}
	
	
	public int insertBusiness(SqlSessionTemplate sqlSession, BusinessTrip bt) {
		return sqlSession.insert("attendanceMapper.insertBusiness", bt);
	}
	
	
	public int increaseCount(SqlSessionTemplate sqlSession, int btno) {
		return sqlSession.update("attendanceMapper.increaseCount", btno);
	}
	
	public BusinessTrip selectBusinessTrip(SqlSessionTemplate sqlSession, int btno) {
		return sqlSession.selectOne("attendanceMapper.selectBusinessTrip", btno);
	}
	
	public int returnBusinessTrip(SqlSessionTemplate sqlSession, int btno) {
		return sqlSession.update("attendanceMapper.returnBusinessTrip", btno);
	}

	
	
}
