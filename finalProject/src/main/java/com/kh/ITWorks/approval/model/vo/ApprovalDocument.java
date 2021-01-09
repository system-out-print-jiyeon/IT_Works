package com.kh.ITWorks.approval.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class ApprovalDocument {		// 결재문서 테이블 

	
	private int docNo;                           // 결재문서 고유번호
	private int memNo;    					 // 사원번호(SEQ_ENO)
	private String docTitle;					 // 결재문서 제목
	private String docContents; 				 // 결재문서 내용
	private Date docEnrollDate;					 // 결재문서 기안일
	private int docRetention;					 // 문서 보존기간
	private String docGrade;				 	 // 문서 보안등급
	private String docStatus;    				 // 문서 삭제여부(Y/N)
	private int docForm;					     // 문서 양식번호
	
	private String memName;
	private int approvalMemNo;
	private String approvalStatus;
	private int approvalOrder;
	
}
