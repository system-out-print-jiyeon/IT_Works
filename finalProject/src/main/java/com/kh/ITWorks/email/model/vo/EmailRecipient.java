package com.kh.ITWorks.email.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// 이메일 받는사람
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class EmailRecipient {
	private int emRecNo;		// 받는 이메일 생성 번호
	private String emTo;		// 받는사람 이메일
	private String emRead;		// 받은메일 읽음여부
	private String emInp;		// 밭은메일 중요
	private String emStatus;	// 받은메일 상태
	private int emNo;			// 이메일 생성 번호
	
	private ArrayList<EmailRecipient> emToList;
}
