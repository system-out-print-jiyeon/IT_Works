package com.kh.ITWorks.email.model.dao;

import java.util.ArrayList;

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
	
	public int emailAttCount(SqlSessionTemplate sqlSession, int emNo) {
		return sqlSession.selectOne("emailMapper.emailAttCount", emNo);
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
	
	public int intertEmailAttach(SqlSessionTemplate sqlSession, EmailAttach ea) {
		return sqlSession.insert("emailMapper.intertEmailAttach", ea);
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
	
	public int emailInsertFromForward(SqlSessionTemplate sqlSession, Email em) {
		return sqlSession.insert("emailMapper.emailInsertFromForward", em);
	}
}
