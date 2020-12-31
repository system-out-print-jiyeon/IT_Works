package com.kh.ITWorks.approval.model.service;

import java.util.ArrayList;

import com.kh.ITWorks.approval.model.vo.ApprovalDocument;
import com.kh.ITWorks.approval.model.vo.ApprovalLine;
import com.kh.ITWorks.approval.model.vo.Attachment;
import com.kh.ITWorks.approval.model.vo.DocumentsRequest;
import com.kh.ITWorks.approval.model.vo.Outgoings;
import com.kh.ITWorks.approval.model.vo.OutgoingsList;
import com.kh.ITWorks.approval.model.vo.Referer;
import com.kh.ITWorks.member.model.vo.Member;

public interface ApprovalService {
	
	// 부서별 사원수 조회
	int businessCount();
	int personnelCount();
	int accountingCount();
	int developerCount();
	int planningCount();
	
	// 부서별 사원 조회
	ArrayList<Member> businessList(Member m);
	ArrayList<Member> personnelList(Member m);
	ArrayList<Member> accountingList(Member m);
	ArrayList<Member> developerList(Member m);
	ArrayList<Member> planningList(Member m);
	
	// 결재문서 기본정보 입력
	int insertApprovalDocument(ApprovalDocument ad);
	int insertApprovalAttachment(Attachment a);
	int insertApprovalLine(ArrayList<ApprovalLine> apLineList);
	int insertApprovalReferer(ArrayList<Referer> refererList);
	
	// 결재문서 상세내용
	// 1. 지출결의서 입력
	int insertOutgoings(Outgoings o);
	int insertOutgoingsList(ArrayList<OutgoingsList> oList);
	
	// 2. 문서발급요청서 입력
	int insertDocumentsRequest(ArrayList<DocumentsRequest> drList);
	
	// 3. 프로젝트업무보고서 입력
	
	// 4. 품의서 입력
	
	// 5. 결재문서 상세보기
	
	// 6. 결재 승인

}
