package com.kh.ITWorks.board.model.vo;

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
public class DepartmentBoard {

	private int dBoardNo;			// 부서게시판번호
	private String dBoardContent;	// 내용
	private int dBoardWriter;		// 작성자
	private int boardNo;			// 게시판카테고리번호
	private char status;			// 상태
	private String explanation;		// 설명
}
