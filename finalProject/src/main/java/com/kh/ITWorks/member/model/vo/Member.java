package com.kh.ITWorks.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString
public class Member {
	
	private int memNo;
	private String memId;
	private String memPwd;
	private String memImg;
	private String memName;
	private String phone;
	private String email;
	private String gender;
	private String birth;
	private String address;
	private String certification;
	private String career;
	private String status;
	private String enrollDate;
	private Date modifyDate;
	private int annualLeave;
	
	private String deptCode;
	private String jobCode;
	
	private String deptName;
	private String jobName;
}
