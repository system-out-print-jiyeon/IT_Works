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
public class WorkDay {						// 출퇴근관리  테이블

	 private int workNo;					// 출퇴근 번호
	 private String onLocation;				// 출근지
	 private String leaveLocation;			// 퇴근지
	 private String onTime;					// 출근시간
	 private String leaveTime;				// 퇴근시간
	 private String workDate;				// 일자
	 private String workStatus;				// 출퇴근 처리/미처리
	 private int memNo;						// 사원번호
	 
	 
	 private int leftDays;
	
}
