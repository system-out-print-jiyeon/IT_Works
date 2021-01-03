package com.kh.ITWorks.email.model.service;

import java.util.ArrayList;

import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.email.model.dto.EmailAttachSelect;
import com.kh.ITWorks.email.model.dto.EmailSelect;
import com.kh.ITWorks.email.model.vo.Email;
import com.kh.ITWorks.email.model.vo.EmailAttach;
import com.kh.ITWorks.email.model.vo.EmailRecipient;

public interface EmailService {
	
	// 보낸메일 리스트***************************************************
	// 메일카운트 조회
	int selectEmailFromListCount(String email);
	// 메일 리스트 조회
	ArrayList<EmailSelect> selectEmailFromList(PageInfo pi, String email);
	// 받은사람 이메일주소 조회
	ArrayList<String> selectEmailFromListRec(int emNo);
	// 첨부파일 여부
	int emailAttCount(int emNo);
	
	// 보낸메일 상세*****************************************************
	// 메일상세 조회
	EmailSelect selectEmailFromDetail(EmailSelect em);
	// 메일첨부파일 리스트 조회
	ArrayList<EmailAttachSelect> selectEmailFromListAtt(int emNo);
	
	// 받은메일 리스트****************************************************
	// 메일카운트 조회
	int selectEmailToListCount(String email);
	// 메일리스트 조회
	ArrayList<EmailSelect> selectEmailToList(PageInfo pi, String email);
	
	// 받은메일 상세*****************************************************
	// 읽음 상태 Y로 변경
	int updateEmailRead(EmailSelect em);
	// 메일상세 조회
	EmailSelect selectEmailToDetail(EmailSelect em);
	// 메일첨부파일 리스트 조회
	ArrayList<EmailAttachSelect> selectEmailToListAtt(EmailSelect em);
	
	// 메일 보내기******************************************************
	// 1.메일 내용
	int insertEmail(Email em);
	// 2.첨부파일
	int intertEmailAttach(EmailAttach ea);
	// 3.받는사람
	int insertEmailRecpient(EmailRecipient er);
	
	
}
