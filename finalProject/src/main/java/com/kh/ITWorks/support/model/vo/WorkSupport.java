package com.kh.ITWorks.support.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class WorkSupport {
	
	
	private int supportNo;					// 글번호
	private String category;				// 카테고리
	private String rdCode;					// 수신부서
	private String sdCode;					// 발신부서
	private String supportTitle;			// 제목
	private String supportContent;			// 내용
	private String startDate;				// 요청시작일
	private String endDate;					// 요청종료일
	private int memNo;						// 신청인
	private String status;					// 상태
	private Date createDate;				// 등록일
	
	

}
