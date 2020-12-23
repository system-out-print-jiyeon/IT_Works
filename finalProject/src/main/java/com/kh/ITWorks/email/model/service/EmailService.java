package com.kh.ITWorks.email.model.service;

import java.util.ArrayList;

import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.email.model.dto.EmailSelect;
import com.kh.ITWorks.email.model.vo.Email;

public interface EmailService {
	
	// 보낸 이메일 리스트 조회용 서비스
	// 카운트 조회
	int selectEmailFromListCount(String email);
	// 리스트 조회
	ArrayList<EmailSelect> selectEmailFromList(PageInfo pi, String email);
	
	
	
}
