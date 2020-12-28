package com.kh.ITWorks.approval.model.service;

import com.kh.ITWorks.approval.model.vo.ApprovalDocument;
import com.kh.ITWorks.approval.model.vo.ApprovalLine;
import com.kh.ITWorks.approval.model.vo.Attachment;
import com.kh.ITWorks.approval.model.vo.Outgoings;
import com.kh.ITWorks.approval.model.vo.Referer;

public interface ApprovalService {
	
	int insertApprovalDocument(ApprovalDocument ad);
	int insertApprovalAttachment(Attachment a);
	int insertApprovalLine(ApprovalLine al);
	int insertApprovalReferer(Referer r);
	
	int insertOutgoings(Outgoings o);

}
