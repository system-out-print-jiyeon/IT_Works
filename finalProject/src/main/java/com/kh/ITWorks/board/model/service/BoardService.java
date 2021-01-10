package com.kh.ITWorks.board.model.service;

import java.util.ArrayList;

import com.kh.ITWorks.board.model.vo.BoardAttachment;
import com.kh.ITWorks.board.model.vo.BoardComment;
import com.kh.ITWorks.board.model.vo.FreeBoard;
import com.kh.ITWorks.common.model.vo.PageInfo;

public interface BoardService {

	// 자유게시판 리스트 조회용 서비스
	int selectFreeBoardListCount();
	ArrayList<FreeBoard> selectFreeBoardList(PageInfo pi);
	
	// 자유게시판 작성용 서비스
	int insertFreeBoard(FreeBoard fb);
	
	// 자유게시판 상세조회용 서비스
	int increaseCount(int fbno);
	FreeBoard selectFreeBoard(int fbno);
	
	// 자유게시판 삭제용 서비스
	int deleteFreeBoard(int fbno);
	// 리스트 삭제 버튼
	int deleteToList(int fbno);
	
	// 게시판 수정용 서비스
	int updateFreeBoard(FreeBoard fb);
	
	// 댓글 리스트 조회용 서비스
		ArrayList<BoardComment> selectReplyList(int fbno);
	
	// 댓글 작성용 서비스
	int insertReply(BoardComment bc);
	
}
