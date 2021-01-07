package com.kh.ITWorks.attendance.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ITWorks.attendance.model.dao.AttendanceDao;
import com.kh.ITWorks.attendance.model.vo.AnnualLeave;
import com.kh.ITWorks.attendance.model.vo.BusinessTrip;
import com.kh.ITWorks.attendance.model.vo.WorkDay;
import com.kh.ITWorks.common.model.vo.PageInfo;
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
	public int selectListCount() {
		return aDao.selectListCount(sqlSession);
	}


	@Override
	public ArrayList<BusinessTrip> selectBusinessTripList(PageInfo pi) {
		return aDao.selectBusinessTripList(sqlSession, pi);
	}
	
	@Override
	public int insertBusiness(BusinessTrip bt) {
		return aDao.insertBusiness(sqlSession, bt);
	}


	@Override
	public int increaseCount(int btno) {
		return aDao.increaseCount(sqlSession, btno);
	}


	@Override
	public BusinessTrip selectBusinessTrip(int btno) {
		return aDao.selectBusinessTrip(sqlSession, btno);
	}


	@Override
	public int returnBusinessTrip(Map<String, Object> approval) {
		return aDao.returnBusinessTrip(sqlSession, approval);
	}


	@Override
	public int approvalBusinessTrip(Map<String, Object> approval) {
		return aDao.approvalBusinessTrip(sqlSession, approval);
	}


	
	
	
	
	
	
	
	
	
	
	@Override
	public int selectListCountAL() {
		return aDao.selectListCountAL(sqlSession);
	}


	@Override
	public ArrayList<AnnualLeave> selectAnnualLeaveList(PageInfo pi) {
		return aDao.selectAnnualLeaveList(sqlSession, pi);
	}


	@Override
	public int insertAnnualLeave(AnnualLeave an) {
		return aDao.insertAnnualLeave(sqlSession, an);
	}


	@Override
	public int increaseCountAL(int anno) {
		return  aDao.increaseCountAL(sqlSession, anno);
	}


	@Override
	public AnnualLeave selectAnnualLeave(int anno) {
		return aDao.selectAnnualLeave(sqlSession, anno);
	}


	@Override
	public int returnAnnualLeave(Map<String, Object> approval) {
		return aDao.returnAnnualLeave(sqlSession, approval);
	}


	@Override
	public int approvalAnnualLeave(Map<String, Object> approval) {
		return aDao.approvalAnnualLeave(sqlSession, approval);
	}


	@Override
	public int subtractAnnualLeave(int prno) {
		return aDao.subtractAnnualLeave(sqlSession, prno);
	}


	@Override
	public int checkOnWork(WorkDay wd) {
		return aDao.checkOnWork(sqlSession, wd);
	}


	@Override
	public int updateOnWork(Map<String, Object> updatewd) {
		return aDao.updateOnWork(sqlSession, updatewd);
	}


	@Override
	public int checkLeaveWork(WorkDay wd) {
		return aDao.checkLeaveWork(sqlSession, wd);
	}


	@Override
	public int updateLeaveWork(Map<String, Object> updatewd) {
		return aDao.updateLeaveWork(sqlSession, updatewd);
	}


	@Override
	public int selectListCountWD(int memNo) {
		return  aDao.selectListCountWD(sqlSession, memNo);
	}


	@Override
	public ArrayList<WorkDay> selectWorkDayList(PageInfo pi, int memNo) {
		return  aDao.selectWorkDayList(sqlSession, pi, memNo);
	}





}
