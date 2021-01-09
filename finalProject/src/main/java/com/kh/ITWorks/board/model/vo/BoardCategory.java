package com.kh.ITWorks.board.model.vo;

import java.sql.Date;

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
public class BoardCategory {

	private int boardNo;			// 게시판카테고리번호
	private String boardName;		// 게시판카테고리명
	private String boardDepartment;	// 부서명
	private Date openingDate;		// 개설일
	private int boardPost;			// 게시글 수
}
