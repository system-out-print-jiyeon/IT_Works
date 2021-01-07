package com.kh.ITWorks.attendance.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ITWorks.attendance.model.vo.AnnualLeave;
import com.kh.ITWorks.attendance.model.vo.BusinessTrip;
import com.kh.ITWorks.attendance.model.vo.WorkDay;
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
	
	public int returnBusinessTrip(SqlSessionTemplate sqlSession, Map<String, Object> approval) {
		return sqlSession.update("attendanceMapper.returnBusinessTrip", approval);
	}
	
	public int approvalBusinessTrip(SqlSessionTemplate sqlSession, Map<String, Object> approval) {
		return sqlSession.update("attendanceMapper.approvalBusinessTrip", approval);
	}

	
	
	
	public int selectListCountAL(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("attendanceMapper.selectListCountAL");
	}
	
	
	public ArrayList<AnnualLeave> selectAnnualLeaveList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectAnnualLeaveList", null, rowBounds);
	}

	public int insertAnnualLeave(SqlSessionTemplate sqlSession, AnnualLeave an) {
		return sqlSession.insert("attendanceMapper.insertAnnualLeave", an);
	}
	
	public int increaseCountAL(SqlSessionTemplate sqlSession, int anno) {
		return sqlSession.update("attendanceMapper.increaseCountAL", anno);
	}
	
	public AnnualLeave selectAnnualLeave(SqlSessionTemplate sqlSession, int anno) {
		return sqlSession.selectOne("attendanceMapper.selectAnnualLeave", anno);
	}
	
	public int returnAnnualLeave(SqlSessionTemplate sqlSession, Map<String, Object> approval) {
		return sqlSession.update("attendanceMapper.returnAnnualLeave", approval);
	}
	
	public int approvalAnnualLeave(SqlSessionTemplate sqlSession, Map<String, Object> approval) {
		return sqlSession.update("attendanceMapper.approvalAnnualLeave", approval);
	}

	public int subtractAnnualLeave(SqlSessionTemplate sqlSession, int prno) {
		return sqlSession.update("attendanceMapper.subtractAnnualLeave", prno);
	}
	
	
	public int checkOnWork(SqlSessionTemplate sqlSession, WorkDay wd) {
		return sqlSession.selectOne("attendanceMapper.checkOnWork", wd);
	}
	
	public int updateOnWork(SqlSessionTemplate sqlSession, Map<String, Object> updatewd) {
		return sqlSession.update("attendanceMapper.updateOnWork", updatewd);
	}
	
	

	public int checkLeaveWork(SqlSessionTemplate sqlSession, WorkDay wd) {
		return sqlSession.selectOne("attendanceMapper.checkLeaveWork", wd);
	}
	
	public int updateLeaveWork(SqlSessionTemplate sqlSession, Map<String, Object> updatewd) {
		return sqlSession.update("attendanceMapper.updateLeaveWork", updatewd);
	}
	
	
	public int selectListCountWD(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("attendanceMapper.selectListCountWD", memNo);
	}
	
	
	public ArrayList<WorkDay> selectWorkDayList(SqlSessionTemplate sqlSession, PageInfo pi, int memNo){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectWorkDayList", memNo, rowBounds);
	}

	
}
