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
public class BusinessTrip {					// 출장 테이블
		
	 private int businessNo;				// 출장번호
	 private String createDate;				// 기안 일시
	 private String businessStart;			// 출장 시작일
	 private String businessEnd;			// 출장 마지막일
	 private String businessPlace;			// 출장지
	 private String businessPhone;			// 출장시연락처
	 private String BusinessPurpose;		// 출장목적
	 private String BusinessPlan;			// 출장계획
	 private String budget;					// 예산
	 private String buStatus;				// 출장 승인/미승인
	 private int buProposer;				// 제출자
	 private int buApprover;				// 승인자
	 
	 
	 private String deptName;
	 private String jobName;
	 private String memName;
	 
	
	
}
