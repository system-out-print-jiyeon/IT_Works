package com.kh.ITWorks.email.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// 이메일 첨부파일
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class EmailAttach {
	private int emAttNo;			// 첨부파일 생성 번호
	private String emOriginName;	// 원본명
	private String emChangeName;	// 수정명
	private int emNo;				// 이메일 생성 번호
	
	private ArrayList<EmailAttach> emAttachList;
}
