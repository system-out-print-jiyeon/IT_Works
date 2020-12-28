package com.kh.ITWorks.approval.model.vo;

import java.util.ArrayList;

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
	
	private ArrayList<OutgoingsList> outgoingsList;
	
}
