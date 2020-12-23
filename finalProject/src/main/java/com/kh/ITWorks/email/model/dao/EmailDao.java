package com.kh.ITWorks.email.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ITWorks.common.model.vo.PageInfo;
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
}
