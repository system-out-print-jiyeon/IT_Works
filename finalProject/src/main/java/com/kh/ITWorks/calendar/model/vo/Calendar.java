package com.kh.ITWorks.calendar.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//캘린더
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Calendar {
	private int calNo;
	private String calTitle;	//
	private String calPlace;	//
	private String calContent;	//
	private String calStartDate;	//
	private String calEndDate;	//
	private String calTime;		//
	private String calColor;	//
	private String calRange;
	private String calStatus;
	
	//join
	private int memNo;//
	private String memName;//
	private String deptName;//
	private String jobName;//
}
