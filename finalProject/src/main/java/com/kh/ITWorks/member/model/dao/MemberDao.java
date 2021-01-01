package com.kh.ITWorks.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.member.model.vo.Member;

@Repository
public class MemberDao {
	
	// 사원 수 카운트 
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectListCount");
	} 
	
	// 사원 리스트 조회
	public ArrayList<Member> selectManageList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int skip = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(skip, pi.getBoardLimit());
		
//		System.out.println("스킵되는 수 : " + skip);
//		System.out.println("현재 페이지 : " + pi.getCurrentPage());
//		System.out.println("한 페이지 게시물 최대 갯수 : " + pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberList", null, rowBounds);
	}
	
	// 사원 상세 조회
	public Member detailView(SqlSessionTemplate sqlSession, int memNo){
		return (Member) sqlSession.selectOne("memberMapper.detailView", memNo);
	}
	
	// 사원 신규 등록 
	public int memberEnroll(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.memberEnroll", m);
	}
	
	// 아이디 중복확인 ajax
	public int idCheck(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.selectOne("memberMapper.idCheck", memId);
	}
	
	// 검색 리스트 조회
	public ArrayList<Member> selectSearch(SqlSessionTemplate sqlSession, String selectList, String keyword, PageInfo pi){
		// 검색한 곳에서 selectList(검색분류)값과 keyword(검색값) 두개가 같이 넘어오는데,
		// sqlSession의 selectList에서는 두개의 파라미터를 못받기 때문에
		// HashMap에 담아서 sql에 구문으로 값을 넘겨줌
		HashMap<String, String> search = new HashMap<String, String>();
		search.put("selectList", selectList);
		search.put("keyword", keyword);		
		
		int skip = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(skip, pi.getBoardLimit());
		
		System.out.println(search);
		
		return (ArrayList)sqlSession.selectList("memberMapper.searchList", search, rowBounds);
	}
	
	// 검색결과 수 카운트
	public int searchListCount(SqlSessionTemplate sqlSession, String selectList, String keyword) {
		HashMap<String, String> search = new HashMap<String,String>();
		search.put("selectList", selectList);
		search.put("keyword", keyword);
		
		return sqlSession.selectOne("memberMapper.searchListCount", search);
	}
	
	// 사원 업데이트
	public int memberUpdate(SqlSessionTemplate sqlSession ,Member m) {
		return sqlSession.update("memberMapper.memberUpdate", m);
	}
	
	// 로그인 사원 정보 가져오기
	public String getPass(SqlSessionTemplate sqlSession, String delId) {
		return sqlSession.selectOne("memberMapper.getPass", delId);
	}
	
	// 사원 삭제 요청
	public int deleteMember(SqlSessionTemplate sqlSession, int delNo) {
		return sqlSession.update("memberMapper.deleteMember", delNo);
	}
}
