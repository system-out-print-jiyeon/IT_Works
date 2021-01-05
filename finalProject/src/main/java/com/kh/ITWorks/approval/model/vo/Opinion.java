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
public class Opinion {		// 의견 테이블

	private int opiNo;   				 // 의견 고유번호
	private String docNo;		 			 // 결재문서 고유번호
	private String memNo;		 		 // 사원번호(SEQ_ENO)
	private String opiContent;			 // 의견 내용
	private Date opiEnrollDate;		 	 // 의견 등록일
	private String opiStatus;			 // 의견 삭제여부(Y/N)
}
