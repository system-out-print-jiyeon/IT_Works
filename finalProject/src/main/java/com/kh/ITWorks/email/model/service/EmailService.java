package com.kh.ITWorks.email.model.service;

import java.util.ArrayList;

import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.email.model.dto.EmailAttachSelect;
import com.kh.ITWorks.email.model.dto.EmailSelect;
import com.kh.ITWorks.email.model.vo.Email;

public interface EmailService {
	
	// 보낸 메일 리스트***************************************************
	// 카운트 조회
	int selectEmailFromListCount(String email);
	// 리스트 조회
	ArrayList<EmailSelect> selectEmailFromList(PageInfo pi, String email);
	// 받은사람 이메일주소 조회
	ArrayList<String> selectEmailFromListRec(int emNo);
	// 첨부파일 여부
	int selectEmailFromListAttCount(int emNo);
	
	// 보낸 메일 상세*****************************************************
	EmailSelect selectEmailFromDetail(int emNo);
	
	ArrayList<EmailAttachSelect> selectEmailFromListAtt(int emNo);
	
	// 받은 메일 리스트****************************************************
	int selectEmailToListCount(String email);
	
}
