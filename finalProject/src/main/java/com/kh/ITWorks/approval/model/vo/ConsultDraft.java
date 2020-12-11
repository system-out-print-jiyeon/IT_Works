package com.kh.ITWorks.approval.model.vo;

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
public class ConsultDraft {		// 품의서 테이블

	private int docNo;  			// 문서 번호
	private String conDept; 		// 기안 부서
	private String conDocType;	    // 문서 구분
	private String conReceiver;	    // 문서 수신자
	private String conExtension;	// 기안자 내선번호
}
