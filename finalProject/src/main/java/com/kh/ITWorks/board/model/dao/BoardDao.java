package com.kh.ITWorks.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ITWorks.board.model.vo.FreeBoard;
import com.kh.ITWorks.common.model.vo.PageInfo;

@Repository
public class BoardDao {

	public int selectFreeBoardListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectFreeBoardListCount");
	}

	public ArrayList<FreeBoard> selectFreeBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectFreeBoardList", null, rowBounds);
	}

	public int insertFreeBoard(SqlSessionTemplate sqlSession, FreeBoard fb) {
		return sqlSession.insert("boardMapper.insertFreeBoard", fb);
	}
	
	public FreeBoard selectFreeBoard(SqlSessionTemplate sqlSession, int fbno) {
		return sqlSession.selectOne("boardMapper.selectFreeBoard", fbno);
	}

	public int deleteFreeBoard(SqlSessionTemplate sqlSession, int fbno) {
		return sqlSession.update("boardMapper.deleteBoard", fbno);
	}


}
