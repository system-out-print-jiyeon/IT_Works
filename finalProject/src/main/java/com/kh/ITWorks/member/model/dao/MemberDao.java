package com.kh.ITWorks.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.member.model.vo.Member;

@Repository
public class MemberDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectListCount");
	} 
	
	public ArrayList<Member> selectManageList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int skip = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(skip, pi.getBoardLimit());
		
//		System.out.println("스킵되는 수 : " + skip);
//		System.out.println("현재 페이지 : " + pi.getCurrentPage());
//		System.out.println("한 페이지 게시물 최대 갯수 : " + pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberList", null, rowBounds);
	}
	
	public Member detailView(SqlSessionTemplate sqlSession, int memNo){
		return (Member) sqlSession.selectOne("memberMapper.detailView", memNo);
	}
	
	public int memberEnroll(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.memberEnroll", m);
	}
}
