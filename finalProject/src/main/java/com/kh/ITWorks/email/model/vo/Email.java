package com.kh.ITWorks.email.model.vo;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// 이메일
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Email {
	private int emNo;				// 이메일 생성 번호
	private String emFrom;			// 보내는사람 이메일
	private String emTitle;			// 제목
	private String emContent;		// 내용
	private String emEnrollDate;	// 보낸날짜
	private String emInp;			// 보낸메일 중요상태
	private String emStatus;		// 보낸메일 상태
}
