package com.kh.ITWorks.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ITWorks.board.model.vo.BoardComment;
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
	
	public int increaseCount(SqlSessionTemplate sqlSession, int fbno) {
		return sqlSession.update("boardMapper.increaseCount", fbno);
	}
	public FreeBoard selectFreeBoard(SqlSessionTemplate sqlSession, int fbno) {
		return sqlSession.selectOne("boardMapper.selectFreeBoard", fbno);
	}

	public int deleteFreeBoard(SqlSessionTemplate sqlSession, int fbno) {
		return sqlSession.update("boardMapper.deleteFreeBoard", fbno);
	}
	
	public int deleteToList(SqlSessionTemplate sqlSession, int fbno) {
		return sqlSession.update("boardMapper.deleteToList", fbno);
	}
	
	public int updateFreeBoard(SqlSessionTemplate sqlSession, FreeBoard fb) {
		return sqlSession.update("boardMapper.updateFreeBoard", fb);
	}


	public ArrayList<BoardComment> selectReplyList(SqlSessionTemplate sqlSession, int fbno){
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList", fbno);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, BoardComment bc) {
		return sqlSession.insert("boardMapper.insertReply", bc);
	}

}
