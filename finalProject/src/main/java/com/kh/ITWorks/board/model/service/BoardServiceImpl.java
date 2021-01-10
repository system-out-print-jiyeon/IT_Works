package com.kh.ITWorks.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ITWorks.board.model.dao.BoardDao;
import com.kh.ITWorks.board.model.vo.FreeBoard;
import com.kh.ITWorks.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BoardDao bDao;
	
	// 자유게시판 리스트 조회
	@Override
	public int selectFreeBoardListCount() {
		return bDao.selectFreeBoardListCount(sqlSession);
	}
	@Override
	public ArrayList<FreeBoard> selectFreeBoardList(PageInfo pi) {
		return bDao.selectFreeBoardList(sqlSession, pi);
	}
	
	@Override
	public int insertFreeBoard(FreeBoard fb) {
		return bDao.insertFreeBoard(sqlSession, fb);
	}

	@Override
	public int increaseCount(int fbno) {
		return bDao.increaseCount(sqlSession, fbno);
	}
	@Override
	public FreeBoard selectFreeBoard(int fbno) {
		return bDao.selectFreeBoard(sqlSession, fbno);
	}
	@Override
	public int deleteFreeBoard(int fbno) {
		return bDao.deleteFreeBoard(sqlSession, fbno);
	}
	@Override
	public int deleteToList(int fbno) {
		return bDao.deleteToList(sqlSession, fbno);
	}
	
	
}
