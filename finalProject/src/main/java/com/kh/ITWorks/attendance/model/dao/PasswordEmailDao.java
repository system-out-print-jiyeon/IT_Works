package com.kh.ITWorks.attendance.model.dao;

import com.kh.ITWorks.member.model.vo.Member;

public interface PasswordEmailDao {

	//R: 회원 정보 조회 - 사용자 ID 해당하는 정보 가져오기
	public Member readMember(String userid) throws Exception;
	
	// 비밀번호 변경
	public int updatePw(Member m) throws Exception;

	public Object idCheck(String memId);

	
}
