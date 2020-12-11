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
public class ProjectReport {   // 프로젝트 업무 보고서 테이블

	private int docNo;  					 // 결재문서 고유번호
	private String prorepReceiver;  		 // 문서 수신자
	private String prorepDrafterPhone;  	 // 기안자 번호 
	private String prorepDrafterEmail;		 // 기안자 이메일
	private String prorepDrafterFax; 		 // 기안자 팩스
	private String prorepKeyNum;  			 // 대표번호
	private String prorepPublic; 			 // 문서 공개여부
	private String prorepRegNum;  			 // 사업자 등록번호
	private String prorepAddress;  			 // 회사 주소
	private String prorepCeo;  				 // 대표이사 성명
}
