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
public class Referer {
	
	private int docNo;
	private String memNo;
	
	private ArrayList<Referer> refererList;

	private String deptName;
	
}
