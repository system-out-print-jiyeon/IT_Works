package com.kh.ITWorks.reservation.model.vo;

import com.kh.ITWorks.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Reservation {
	
	private int reserveNo;			// 예약번호
	private String room;			// 회의실
	private String deptCode;			// 부서
	private String startPeriod;		// 시작일자+시간
	private String endPeriod;		// 종료일자+시간
	private String object;			// 사용목적
	private String visiterYn;		// 외부인여부
	private int floor;				// 회의실층
	private int memNo;				// 신청인
	private String status;			// 상태
	
	private Member mem;
	

}
