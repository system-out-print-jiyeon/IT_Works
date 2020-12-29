package com.kh.ITWorks.email.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.email.model.dto.EmailAttachSelect;
import com.kh.ITWorks.email.model.dto.EmailSelect;
import com.kh.ITWorks.email.model.vo.Email;

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
	
	public int selectEmailFromListAttCount(SqlSessionTemplate sqlSession, int emNo) {
		return sqlSession.selectOne("emailMapper.selectEmailFromListAttCount", emNo);
	}
	
	public EmailSelect selectEmailFromDetail(SqlSessionTemplate sqlSession, int emNo) {
		return sqlSession.selectOne("emailMapper.selectEmailFromDetail", emNo);
	}
	
	public ArrayList<EmailAttachSelect> selectEmailFromListAtt(SqlSessionTemplate sqlSession, int emNo){
		return (ArrayList)sqlSession.selectList("emailMapper.selectEmailFromListAtt", emNo);
	}
	
	public int selectEmailToListCount(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("emailMapper.selectEmailToListCount", email);
	}
	
	
}
