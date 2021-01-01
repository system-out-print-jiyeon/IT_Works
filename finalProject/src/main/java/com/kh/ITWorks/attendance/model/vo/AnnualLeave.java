package com.kh.ITWorks.attendance.model.vo;


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
public class AnnualLeave {				// 연차 테이블

	 private int annualNo;				// 연차번호
	 private int leftAnnual;			// 남은 연차 (연차는 전사원 15개로 통일)
	 private String createDate;			// 기안일시
	 private String annualStart;		// 연차 시작일
	 private String annualEnd;			// 연차 마지막일
	 private String emergencyPhone;		// 비상연락처
	 private String reason;				// 사유
	 private String anStatus;			// 연차 승인/미승인
	 private int anProposer;			// 제출자
	 private int anApprover;			// 승인자
	
	 
	 private String deptName;
	 private String jobName;
	 private String memName;
	 
	 
}
