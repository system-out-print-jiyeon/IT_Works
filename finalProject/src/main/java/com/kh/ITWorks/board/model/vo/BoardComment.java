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
public class BoardComment {

	private int comNo;			// 댓글번호
	private String comContent;	// 댓글내용
	private String createDate;	// 작성일
	private int refBno;			// 참조게시글번호
	private int comWriter;		// 작성자
	private char status;		// 상태
	private char comDivision;	// 참조게시판구분

	private String memName;
}
