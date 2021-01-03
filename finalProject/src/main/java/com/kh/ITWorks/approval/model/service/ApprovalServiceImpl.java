package com.kh.ITWorks.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ITWorks.approval.model.dao.ApprovalDao;
import com.kh.ITWorks.approval.model.vo.ApprovalDocument;
import com.kh.ITWorks.approval.model.vo.ApprovalLine;
import com.kh.ITWorks.approval.model.vo.Attachment;
import com.kh.ITWorks.approval.model.vo.DocumentsRequest;
import com.kh.ITWorks.approval.model.vo.Opinion;
import com.kh.ITWorks.approval.model.vo.Outgoings;
import com.kh.ITWorks.approval.model.vo.OutgoingsList;
import com.kh.ITWorks.approval.model.vo.Referer;
import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.member.model.vo.Member;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ApprovalDao aDao;
	
	// 부서별 사원수 조회
	@Override
	public int businessCount() {
		return aDao.businessCount(sqlSession);
	}
	@Override
	public int personnelCount() {
		return aDao.personnelCount(sqlSession);
	}
	@Override
	public int accountingCount() {
		return aDao.accountingCount(sqlSession);
	}
	@Override
	public int developerCount() {
		return aDao.developerCount(sqlSession);
	}
	@Override
	public int planningCount() {
		return aDao.planningCount(sqlSession);
	}

	// 부서별 사원 조회

	@Override
	public ArrayList<Member> businessList(Member m) {
		return aDao.businessList(sqlSession, m);
	}
	@Override
	public ArrayList<Member> personnelList(Member m) {
		return aDao.personnelList(sqlSession, m);
	}
	@Override
	public ArrayList<Member> accountingList(Member m) {
		return aDao.accountingList(sqlSession, m);
	}
	@Override
	public ArrayList<Member> developerList(Member m) {
		return aDao.developerList(sqlSession, m);
	}
	@Override
	public ArrayList<Member> planningList(Member m) {
		return aDao.planningList(sqlSession, m);
	}
	
	
	@Override
	public int insertApprovalDocument(ApprovalDocument ad) {
		return aDao.insertApprovalDocument(ad, sqlSession);
	}

	@Override
	public int insertApprovalAttachment(Attachment a) {
		return aDao.insertApprovalAttachment(a, sqlSession);
	}

	@Override
	public int insertApprovalLine(ArrayList<ApprovalLine> apLineList) {
		return aDao.insertApprovalLine(apLineList, sqlSession);
	}

	@Override
	public int insertApprovalReferer(ArrayList<Referer> refererList) {
		return aDao.insertApprovalRefere(refererList, sqlSession);
	}

	@Override
	public int insertOutgoings(Outgoings o) {
		return aDao.insertOutgoings(o, sqlSession);
	}

	@Override
	public int insertOutgoingsList(ArrayList<OutgoingsList> oList) {
		return aDao.insertOutgoingsList(oList, sqlSession);
	}

	@Override
	public int insertDocumentsRequest(ArrayList<DocumentsRequest> drList) {
		return aDao.insertDocumentsRequest(drList, sqlSession);
	}
	
	/* 결재문서 상세보기 select */
	@Override
	public ApprovalDocument selectApprovalDocument(int docNo) {
		return aDao.selectApprovalDocument(sqlSession, docNo);
	}
	@Override
	public ArrayList<ApprovalLine> selectApprovalLine(int docNo) {
		return aDao.selectApprovalLine(sqlSession, docNo);
	}
	@Override
	public ArrayList<Referer> selectReferer(int docNo) {
		return aDao.selectReferer(sqlSession, docNo);
	}
	@Override
	public ArrayList<Attachment> selectAttachment(int docNo) {
		return aDao.selectAttachment(sqlSession, docNo);
	}
	@Override
	public ArrayList<Opinion> selectOpinion(int docNo) {
		return aDao.selectOpinion(sqlSession, docNo);
	}

}
