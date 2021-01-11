package com.kh.ITWorks.addressbook.model.vo;

import com.kh.ITWorks.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString
public class AddressBook {

	private int addNo;
	private String addName;
	private String addPhone;
	private String addDepartment;
	private String addDepartmentPhone;
	private String addSpot;
	private String addEmail;
	private String addCategory;
	private String addCompanyName;
	private String status;
	private int addWriter;
	
	private String departmentName;
	private String jobgradeName;
	
	
}
