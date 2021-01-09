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
public class BoardLike {

	private int likeNo;			// 좋아요 번호
	private int refBno;			// 참조게시글 번호
	private char likeDivision;	// 참조게시글구분
	private int memNo;			// 사원
}
