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
	
	// 전체메일 리스트***************************************************
	// 카운트 조회
	@Override
	public int selectEmailListCount(String email) {
		return emDao.selectEmailListCount(sqlSession, email);
	}
	// 리스트 조회
	@Override
	public ArrayList<EmailSelect> selectEmailList(PageInfo pi, String email) {
		return emDao.selectEmailList(sqlSession, pi, email);
	}
	
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
	// 받은사람 이메일주소 + 읽음여부 조회
	@Override
	public ArrayList<EmailSelect> selectEmailFromListRecDetail(int emNo){
		return emDao.selectEmailFromListRecDetail(sqlSession, emNo);
	}
	
	// 첨부파일 여부
	@Override
	public int emailAttCount(int emNo) {
		return emDao.emailAttCount(sqlSession, emNo);
	}
	// 보낸메일 리스트 삭제버튼
	@Override
	public int deleteEmailFromList(int emNo) {
		return emDao.deleteEmailFromList(sqlSession, emNo);
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
	// 카운트 조회
	@Override
	public int selectEmailToListCount(String email) {
		return emDao.selectEmailToListCount(sqlSession, email);
	}
	// 리스트 조회
	@Override
	public ArrayList<EmailSelect> selectEmailToList(PageInfo pi, String email) {
		return emDao.selectEmailToList(sqlSession, pi, email);
	}
	// 리스트 삭제버튼
	@Override
	public int deleteEmailToList(int emRecNo) {
		return emDao.deleteEmailToList(sqlSession, emRecNo);
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
	public int insertEmailAttach(EmailAttach ea) {
		return emDao.insertEmailAttach(sqlSession, ea);
	}
	// 3.메일 보낸후 반는사람
	@Override
	public int insertEmailRecpient(EmailRecipient er) {
		return emDao.insertEmailRecpient(sqlSession, er);
	}
	
	// 보낸 메일 상세 메뉴들 ***************************************************
	// 중요메일 등록
	@Override
	public int updateEmailFromInp(Email em) {
		return emDao.updateEmailFromInp(sqlSession, em);
	}
	// 중요메일 취소
	@Override
	public int cancelEmailFromInp(Email em) {
		return emDao.cancelEmailFromInp(sqlSession, em);
	}
	// 메일 전달하기
	@Override
	public int insertEmailForward(Email em) {
		return emDao.insertEmailForward(sqlSession, em);
	}
	// 메일 삭제하기
	@Override
	public int deleteEmailFrom(Email em) {
		return emDao.deleteEmailFrom(sqlSession, em);
	}
	
	// 받은 메일 상세 메뉴들 ***************************************************
	// 중요메일 등록
	@Override
	public int updateEmailToInp(EmailRecipient er) {
		return emDao.updateEmailToInp(sqlSession, er);
	}
	// 중요메일 취소
	@Override
	public int cancelEmailToInp(EmailRecipient er) {
		return emDao.cancelEmailToInp(sqlSession, er);
	}
	// 메일 삭제
	@Override
	public int deleteEmailTo(EmailRecipient er) {
		return emDao.deleteEmailTo(sqlSession, er);
	}
	
	// 중요메일 리스트 *******************************************************
	// 카운트 조회
	@Override
	public int selectEmailInpListCount(String email) {
		return emDao.selectEmailInpListCount(sqlSession, email);
	}
	// 리스트 조회
	@Override
	public ArrayList<EmailSelect> selectEmailInpList(PageInfo pi, String email){
		return emDao.selectEmailInpList(sqlSession, pi, email);
	}
	
	// 휴지통 리스트 ********************************************************
	// 카운트 조회
	@Override
	public int selectEmailDeleteListCount(String email) {
		return emDao.selectEmailDeleteListCount(sqlSession, email);
	}
	// 리스트 조회
	@Override
	public ArrayList<EmailSelect> selectEmailDeleteList(PageInfo pi, String email){
		return emDao.selectEmailDeleteList(sqlSession, pi, email);
	}
	// 이메일 복원
	@Override
	public int restoreEmailFromList(int emNo) {
		return emDao.restoreEmailFromList(sqlSession, emNo);
	}
	@Override
	public int restoreEmailToList(int emRecNo) {
		return emDao.restoreEmailToList(sqlSession, emRecNo);
	}
	// 이메일 영구삭제
	public int removeEmailFromList(int emNo) {
		return emDao.removeEmailFromList(sqlSession, emNo);
	}
	public int removeEmailToList(int emRecNo) {
		return emDao.removeEmailToList(sqlSession, emRecNo);
	}
	
	// 검색 **************************************************************
	// 전체메일 검색 카운트
	@Override
	public int selectEmailListSearchCount(String email, String condition, String keyword, String imp) {
		return emDao.selectEmailListSearchCount(sqlSession, email, condition, keyword, imp);
	}
	// 전체메일 검색 리스트
	@Override
	public ArrayList<EmailSelect> selectEmailListSearch(PageInfo pi, String email, String condition, String keyword, String imp){
		return emDao.selectEmailListSearch(sqlSession, pi, email, condition, keyword, imp);
	}
	
	// 보낸메일 검색 카운트
	@Override
	public int selectEmailFromListSearchCount(String email, String condition, String keyword, String imp) {
		return emDao.selectEmailFromListSearchCount(sqlSession, email, condition, keyword, imp);
	}
	// 보낸메일 검색 리스트
	@Override
	public ArrayList<EmailSelect> selectEmailFromListSearch(PageInfo pi, String email, String condition, String keyword, String imp){
		return emDao.selectEmailFromListSearch(sqlSession, pi, email, condition, keyword, imp);
	}
	
	// 받은메일 검색 카운트
	@Override
	public int selectEmailToListSearchCount(String email, String condition, String keyword, String imp) {
		return emDao.selectEmailToListSearchCount(sqlSession, email, condition, keyword, imp);
	}
	// 받은메일 검색 리스트
	public ArrayList<EmailSelect> selectEmailToListSearch(PageInfo pi, String email, String condition, String keyword, String imp) {
		return emDao.selectEmailToListSearch(sqlSession, pi, email, condition, keyword, imp);
	}
}
