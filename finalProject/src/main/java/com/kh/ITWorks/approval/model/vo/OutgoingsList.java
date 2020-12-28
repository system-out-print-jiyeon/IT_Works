package com.kh.ITWorks.approval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString
public class OutgoingsList {
	
	// 지출결의서 지출 리스트
	private String outDate;
	private String outCategory;
	private int outPrice;
	private String outHistory;
	private String outRemark;

}
