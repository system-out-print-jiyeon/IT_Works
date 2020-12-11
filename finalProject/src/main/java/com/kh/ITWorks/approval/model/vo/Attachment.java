package com.kh.ITWorks.approval.model.vo;

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
public class Attachment {  	// 첨부파일 테이블

	private int attNo;     				// 첨부파일 고유번호
	private int docNo;				    // 결재문서 고유번호
	private String attOriginName; 	    // 첨부파일 원본명
	private String attChangeName;	    // 첨부파일 수정명
	private String attPath;  			// 첨부파일 경로
	private String attLoadpath;  		// 첨부파일 저장경로
	
}
