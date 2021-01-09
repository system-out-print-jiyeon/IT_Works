package com.kh.ITWorks.email.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.email.model.dto.EmailAttachSelect;
import com.kh.ITWorks.email.model.dto.EmailSelect;
import com.kh.ITWorks.email.model.vo.Email;
import com.kh.ITWorks.email.model.vo.EmailAttach;
import com.kh.ITWorks.email.model.vo.EmailRecipient;

@Repository
public class EmailDao {
	
	public int selectEmailListCount(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("emailMapper.selectEmailListCount", email );
	}
	
	public ArrayList<EmailSelect> selectEmailList(SqlSessionTemplate sqlSession, PageInfo pi, String email){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("emailMapper.selectEmailList", email, rowBounds);
	}
	
	public int selectEmailFromListCount(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("emailMapper.selectEmailFromListCount", email);
	}
	
	public ArrayList<EmailSelect> selectEmailFromList(SqlSessionTemplate sqlSession, PageInfo pi, String email){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("emailMapper.selectEmailFromList", email, rowBounds);
	}
	
	public ArrayList<String> selectEmailFromListRec(SqlSessionTemplate sqlSession, int emNo){
		return (ArrayList)sqlSession.selectList("emailMapper.selectEmailFromListRec", emNo);
	}
	
	public ArrayList<EmailSelect> selectEmailFromListRecDetail(SqlSessionTemplate sqlSession, int emNo){
		return (ArrayList)sqlSession.selectList("emailMapper.selectEmailFromListRecDetail", emNo);
	}
	
	public int emailAttCount(SqlSessionTemplate sqlSession, int emNo) {
		return sqlSession.selectOne("emailMapper.emailAttCount", emNo);
	}
	
	public int deleteEmailFromList(SqlSessionTemplate sqlSession, int emNo) {
		return sqlSession.update("emailMapper.deleteEmailFromList", emNo);
	}
	
	public EmailSelect selectEmailFromDetail(SqlSessionTemplate sqlSession, EmailSelect em) {
		return sqlSession.selectOne("emailMapper.selectEmailFromDetail", em);
	}
	
	
	public ArrayList<EmailAttachSelect> selectEmailFromListAtt(SqlSessionTemplate sqlSession, int emNo){
		return (ArrayList)sqlSession.selectList("emailMapper.selectEmailFromListAtt", emNo);
	}
	
	public int selectEmailToListCount(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("emailMapper.selectEmailToListCount", email);
	}
	
	public ArrayList<EmailSelect> selectEmailToList(SqlSessionTemplate sqlSession, PageInfo pi, String email){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("emailMapper.selectEmailToList", email, rowbounds);
	}
	
	public int deleteEmailToList(SqlSessionTemplate sqlSession, int emRecNo) {
		return sqlSession.update("emailMapper.deleteEmailToList", emRecNo);
	}
	
	public int updateEmailRead(SqlSessionTemplate sqlSession, EmailSelect em) {
		return sqlSession.update("emailMapper.updateEmailRead", em);
	}
	
	public EmailSelect selectEmailToDetail(SqlSessionTemplate sqlSession, EmailSelect em) {
		return sqlSession.selectOne("emailMapper.selectEmailToDetail", em);
	}

	public ArrayList<EmailAttachSelect> selectEmailToListAtt(SqlSessionTemplate sqlSession, EmailSelect em) {
		return (ArrayList)sqlSession.selectList("emailMapper.selectEmailToListAtt", em);
	}
	
	public int insertEmail(SqlSessionTemplate sqlSession, Email em) {
		return sqlSession.insert("emailMapper.insertEmail", em);
	}
	
	public int insertEmailAttach(SqlSessionTemplate sqlSession, EmailAttach ea) {
		return sqlSession.insert("emailMapper.insertEmailAttach", ea);
	}
	
	public int insertEmailRecpient(SqlSessionTemplate sqlSession, EmailRecipient er) {
		return sqlSession.insert("emailMapper.insertEmailRecpient", er);
	}
	
	public int updateEmailFromInp(SqlSessionTemplate sqlSession, Email em) {
		return sqlSession.update("emailMapper.updateEmailFromInp", em);
	}
	
	public int cancelEmailFromInp(SqlSessionTemplate sqlSession, Email em) {
		return sqlSession.update("emailMapper.cancelEmailFromInp", em);
	}
	
	public int insertEmailForward(SqlSessionTemplate sqlSession, Email em) {
		return sqlSession.insert("emailMapper.insertEmailForward", em);
	}
	
	public int deleteEmailFrom(SqlSessionTemplate sqlSession, Email em) {
		return sqlSession.update("emailMapper.deleteEmailFrom", em);
	}
	
	public int updateEmailToInp(SqlSessionTemplate sqlSession, EmailRecipient er) {
		return sqlSession.update("emailMapper.updateEmailToInp", er);
	}
	
	public int cancelEmailToInp(SqlSessionTemplate sqlSession, EmailRecipient er) {
		return sqlSession.update("emailMapper.cancelEmailToInp", er);
	}
	
	public int deleteEmailTo(SqlSessionTemplate sqlSession, EmailRecipient er) {
		return sqlSession.update("emailMapper.deleteEmailTo", er);
	}
	
	public int selectEmailInpListCount(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("emailMapper.selectEmailInpListCount", email);
	}
	
	public ArrayList<EmailSelect> selectEmailInpList(SqlSessionTemplate sqlSession, PageInfo pi, String email){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("emailMapper.selectEmailInpList", email, rowBounds);
	}
	
	public int selectEmailDeleteListCount(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("emailMapper.selectEmailDeleteListCount", email);
	}
	
	public ArrayList<EmailSelect> selectEmailDeleteList(SqlSessionTemplate sqlSession, PageInfo pi, String email){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("emailMapper.selectEmailDeleteList", email, rowBounds);
	}
	
	public int restoreEmailFromList(SqlSessionTemplate sqlSession, int emNo) {
		return sqlSession.update("emailMapper.restoreEmailFromList", emNo);
	}
	
	public int restoreEmailToList(SqlSessionTemplate sqlSession, int emRecNo) {
		return sqlSession.update("emailMapper.restoreEmailToList", emRecNo);
	}
	
	public int removeEmailFromList(SqlSessionTemplate sqlSession, int emNo) {
		return sqlSession.update("emailMapper.removeEmailFromList", emNo);
	}
	
	public int removeEmailToList(SqlSessionTemplate sqlSession, int emRecNo) {
		return sqlSession.update("emailMapper.removeEmailToList", emRecNo);
	}
	
	public int selectEmailListSearchCount(SqlSessionTemplate sqlSession, String email, String condition, String keyword, String imp) {
		HashMap<String, String> map = new HashMap();
		map.put("email", email);
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("imp", imp);
		return sqlSession.selectOne("emailMapper.selectEmailListSearchCount", map);
	}
	
	public ArrayList<EmailSelect> selectEmailListSearch(SqlSessionTemplate sqlSession, PageInfo pi, String email, String condition, String keyword, String imp){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		HashMap<String, String> map = new HashMap();
		map.put("email", email);
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("imp", imp);
		return (ArrayList)sqlSession.selectList("emailMapper.selectEmailListSearch", map, rowBounds);
	}
	
	public int selectEmailFromListSearchCount(SqlSessionTemplate sqlSession, String email, String condition, String keyword, String imp) {
		HashMap<String, String> map = new HashMap();
		map.put("email", email);
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("imp", imp);
		return sqlSession.selectOne("emailMapper.selectEmailFromListSearchCount", map);
	}
	
	public ArrayList<EmailSelect> selectEmailFromListSearch(SqlSessionTemplate sqlSession, PageInfo pi, String email, String condition, String keyword, String imp){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		HashMap<String, String> map = new HashMap();
		map.put("email", email);
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("imp", imp);
		return (ArrayList)sqlSession.selectList("emailMapper.selectEmailFromListSearch", map, rowBounds);
	}
	
	public int selectEmailToListSearchCount(SqlSessionTemplate sqlSession, String email, String condition, String keyword, String imp) {
		HashMap<String, String> map = new HashMap();
		map.put("email", email);
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("imp", imp);
		return sqlSession.selectOne("emailMapper.selectEmailToListSearchCount", map);
	}
	
	public ArrayList<EmailSelect> selectEmailToListSearch(SqlSessionTemplate sqlSession, PageInfo pi, String email, String condition, String keyword, String imp){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		HashMap<String, String> map = new HashMap();
		map.put("email", email);
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("imp", imp);
		return (ArrayList)sqlSession.selectList("emailMapper.selectEmailToListSearch", map, rowBounds);
	}

}
