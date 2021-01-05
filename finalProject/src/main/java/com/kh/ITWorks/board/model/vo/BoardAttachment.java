package com.kh.ITWorks.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class BoardAttachment {
	
	private int attNo;			// 첨부파일번호
	private String originName;	// 원본파일명
	private String changeName;	// 수정파일명
	private String filePath;	// 저장경로
	private String boDivision;	// 참조게시판 구분 (0:자유, 1:업무협업)
	private int refBno;			// 참조게시글번호
	
	

}
