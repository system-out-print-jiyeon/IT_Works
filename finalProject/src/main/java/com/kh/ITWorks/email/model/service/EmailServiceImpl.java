package com.kh.ITWorks.email.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.email.model.dao.EmailDao;
import com.kh.ITWorks.email.model.dto.EmailAttachSelect;
import com.kh.ITWorks.email.model.dto.EmailSelect;

	

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private EmailDao emDao;
	
	// 보낸 메일 리스트***************************************************
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
	public int selectEmailFromListAttCount(int emNo) {
		return emDao.selectEmailFromListAttCount(sqlSession, emNo);
	}
	
	// 보낸 메일 상세*****************************************************
	@Override
	public EmailSelect selectEmailFromDetail(int emNo) {
		return emDao.selectEmailFromDetail(sqlSession, emNo);
	}

	@Override
	public ArrayList<EmailAttachSelect> selectEmailFromListAtt(int emNo) {
		return emDao.selectEmailFromListAtt(sqlSession, emNo);
	}
	
	// 받은 메일 리스트****************************************************
	@Override
	public int selectEmailToListCount(String email) {
		return emDao.selectEmailToListCount(sqlSession, email);
	}
	
	
	
}
