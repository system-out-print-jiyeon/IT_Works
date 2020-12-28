package com.kh.ITWorks.approval.model.service;

import java.util.ArrayList;

import com.kh.ITWorks.approval.model.vo.ApprovalDocument;
import com.kh.ITWorks.approval.model.vo.ApprovalLine;
import com.kh.ITWorks.approval.model.vo.Attachment;
import com.kh.ITWorks.approval.model.vo.DocumentsRequest;
import com.kh.ITWorks.approval.model.vo.Outgoings;
import com.kh.ITWorks.approval.model.vo.Referer;

public interface ApprovalService {
	
	// 결재문서 기본정보 입력
	int insertApprovalDocument(ApprovalDocument ad);
	int insertApprovalAttachment(Attachment a);
	int insertApprovalLine(ApprovalLine al);
	int insertApprovalReferer(Referer r);
	
	// 결재문서 상세내용
	// 1. 지출결의서 입력
	int insertOutgoings(Outgoings o);
	int insertOutgoingsList(ArrayList<Outgoings> oList);
	
	// 2. 문서발급요청서 입력
	int insertDocumentsRequest(ArrayList<DocumentsRequest> drList);
	
	// 3. 프로젝트업무보고서 입력
	
	// 4. 품의서 입력

}
