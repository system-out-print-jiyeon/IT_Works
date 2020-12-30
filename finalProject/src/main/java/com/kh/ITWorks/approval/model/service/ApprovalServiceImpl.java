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
import com.kh.ITWorks.approval.model.vo.Outgoings;
import com.kh.ITWorks.approval.model.vo.OutgoingsList;
import com.kh.ITWorks.approval.model.vo.Referer;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ApprovalDao aDao;

	@Override
	public int insertApprovalDocument(ApprovalDocument ad) {
		return aDao.insertApprovalDocument(ad, sqlSession);
	}

	@Override
	public int insertApprovalAttachment(Attachment a) {
		return aDao.insertApprovalAttachment(a, sqlSession);
	}

	@Override
	public int insertApprovalLine(ApprovalLine al) {
		return aDao.insertApprovalLine(al, sqlSession);
	}

	@Override
	public int insertApprovalReferer(Referer r) {
		return aDao.insertApprovalRefere(r, sqlSession);
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

}
