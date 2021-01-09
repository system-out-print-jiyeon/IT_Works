package com.kh.ITWorks.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class FreeBoard {

	private int fBoardNo;         // 자유게시판 번호
	private String fBoardTitle;   // 제목
	private Date fCreateDate;     // 작성일
	private int fCount;       	  // 조회수
	private int fBoardWriter;	  // 작성자
	private String fBoardContent; // 내용
	private char boardDivision;   // 공지구분
	private char status; 		  // 상태
	private char fDisclosure;	  // 공개
	private char fAllowed;		  // 댓글허용/비허용
	
	
	private String memName;
	
	
}
