package com.kh.ITWorks.approval.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ITWorks.approval.model.vo.ApprovalDocument;
import com.kh.ITWorks.approval.model.vo.ApprovalLine;
import com.kh.ITWorks.approval.model.vo.Attachment;
import com.kh.ITWorks.approval.model.vo.DocumentsRequest;
import com.kh.ITWorks.approval.model.vo.Outgoings;
import com.kh.ITWorks.approval.model.vo.OutgoingsList;
import com.kh.ITWorks.approval.model.vo.Referer;

@Repository
public class ApprovalDao {

	public int insertApprovalDocument(ApprovalDocument ad, SqlSessionTemplate sqlSession) {
		return 0;
	}

	public int insertApprovalAttachment(Attachment a, SqlSessionTemplate sqlSession) {
		return 0;
	}

	public int insertApprovalLine(ApprovalLine al, SqlSessionTemplate sqlSession) {
		return 0;
	}

	public int insertApprovalRefere(Referer r, SqlSessionTemplate sqlSession) {
		return 0;
	}

	public int insertOutgoings(Outgoings o, SqlSessionTemplate sqlSession) {
		return 0;
	}

	public int insertOutgoingsList(ArrayList<OutgoingsList> oList, SqlSessionTemplate sqlSession) {
		return 0;
	}

	public int insertDocumentsRequest(ArrayList<DocumentsRequest> drList, SqlSessionTemplate sqlSession) {
		return 0;
	}

}
