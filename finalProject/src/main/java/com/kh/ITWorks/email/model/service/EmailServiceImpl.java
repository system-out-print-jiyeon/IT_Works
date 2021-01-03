package com.kh.ITWorks.email.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.email.model.dao.EmailDao;
import com.kh.ITWorks.email.model.dto.EmailAttachSelect;
import com.kh.ITWorks.email.model.dto.EmailSelect;
import com.kh.ITWorks.email.model.vo.Email;
import com.kh.ITWorks.email.model.vo.EmailAttach;
import com.kh.ITWorks.email.model.vo.EmailRecipient;

	

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private EmailDao emDao;
	
	// 보낸메일 리스트***************************************************
	// 카운트 조회
	@Override
	public int selectEmailFromListCount(String email) {
		return emDao.selectEmailFromListCount(sqlSession, email);
	}
	// 리스트 조회
	@Override
	public ArrayList<EmailSelect> selectEmailFromList(PageInfo pi, String email) {
		return emDao.selectEmailFromList(sqlSession, pi, email);
	}
	// 받은사람 이메일주소 조회
	@Override
	public ArrayList<String> selectEmailFromListRec(int emNo) {
		return emDao.selectEmailFromListRec(sqlSession, emNo);
	}
	// 첨부파일 여부
	@Override
	public int emailAttCount(int emNo) {
		return emDao.emailAttCount(sqlSession, emNo);
	}
	
	// 보낸메일 상세*****************************************************
	@Override
	public EmailSelect selectEmailFromDetail(EmailSelect em) {
		return emDao.selectEmailFromDetail(sqlSession, em);
	}

	@Override
	public ArrayList<EmailAttachSelect> selectEmailFromListAtt(int emNo) {
		return emDao.selectEmailFromListAtt(sqlSession, emNo);
	}
	
	// 받은메일 리스트****************************************************
	@Override
	public int selectEmailToListCount(String email) {
		return emDao.selectEmailToListCount(sqlSession, email);
	}
	
	@Override
	public ArrayList<EmailSelect> selectEmailToList(PageInfo pi, String email) {
		return emDao.selectEmailToList(sqlSession, pi, email);
	}
	
	// 받은메일 상세*******************************************************
	@Override
	public int updateEmailRead(EmailSelect em) {
		return emDao.updateEmailRead(sqlSession, em);
	}
	@Override
	public EmailSelect selectEmailToDetail(EmailSelect em) {
		return emDao.selectEmailToDetail(sqlSession, em);
	}
	@Override
	public ArrayList<EmailAttachSelect> selectEmailToListAtt(EmailSelect em) {
		return emDao.selectEmailToListAtt(sqlSession, em);
	}

	// 메일 보내기*********************************************************
	// 1.메일
	@Override
	public int insertEmail(Email em) {
		return emDao.insertEmail(sqlSession, em);
	}
	// 2.메일 보낸후 첨부파일
	@Override
	public int intertEmailAttach(EmailAttach ea) {
		return emDao.intertEmailAttach(sqlSession, ea);
	}
	// 3.메일 보낸후 반는사람
	@Override
	public int insertEmailRecpient(EmailRecipient er) {
		return emDao.insertEmailRecpient(sqlSession, er);
	}
	
}
