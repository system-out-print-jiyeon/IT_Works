package com.kh.ITWorks.member.model.service;

import java.util.ArrayList;

import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.member.model.vo.Member;

public interface MemberService {

	int selectListCount();
	ArrayList<Member> selectManageList(PageInfo pi);
	
	Member detailView(int memNo);
	
	int memberEnroll(Member m);
	
	int idCheck(String memId);
	
	int searchListCount(String selectList, String keyword);
	ArrayList<Member> selectSearch(String selectList, String keyword, PageInfo pi);
	
	int memberUpdate(Member m);
	
	String getPass(String delId);
	
	int deleteMember(int delNo);
	
	
}
