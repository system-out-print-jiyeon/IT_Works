package com.kh.ITWorks.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.member.model.dao.MemberDao;
import com.kh.ITWorks.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MemberDao mDao;

	@Override
	public int selectListCount() {
		return mDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectManageList(PageInfo pi) {
		return mDao.selectManageList(sqlSession, pi);
	}

	@Override
	public Member detailView(int memNo) {		
		return mDao.detailView(sqlSession, memNo);
	}

	@Override
	public int memberEnroll(Member m) {
		return mDao.memberEnroll(sqlSession, m);
	}

	@Override
	public int idCheck(String memId) {
		return mDao.idCheck(sqlSession, memId);
	}

	@Override
	public ArrayList<Member> selectSearch(String selectList, String keyword, PageInfo pi) {
		return mDao.selectSearch(sqlSession, selectList, keyword, pi);
	}

	@Override
	public int searchListCount(String selectList, String keyword) {
		return mDao.searchListCount(sqlSession, selectList, keyword);
	}

	@Override
	public int memberUpdate(Member m) {
		return mDao.memberUpdate(sqlSession, m);
	}

	@Override
	public String getPass(String delId) {
		return mDao.getPass(sqlSession, delId);
	}

	@Override
	public int deleteMember(int delNo) {
		return mDao.deleteMember(sqlSession, delNo);
	}
	

}
