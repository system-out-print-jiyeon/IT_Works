package com.kh.ITWorks.approval.model.vo;

import java.util.ArrayList;

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
public class ApprovalLine {
	
	private int docNo;
	private String memNo;
	private String approvalStatus;
	private int approvalOrder;
	
	private String memName;
	private String jobName;
	
	private ArrayList<ApprovalLine> apLineList;

}
