package com.kh.ITWorks.approval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class Outgoings {
	
	// 지출결의서기본
	private int docNo;
	private String outReason;
	private int outSumprice;
	
	// 지출결의서 지출 리스트
	private String outDate;
	private String outCategory;
	private int outPrice;
	private String outHistory;
	private String outRemark;
	
}
