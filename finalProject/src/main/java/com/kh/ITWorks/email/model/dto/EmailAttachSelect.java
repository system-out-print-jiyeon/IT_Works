package com.kh.ITWorks.email.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// 이메일 첨부파일 select용
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class EmailAttachSelect {
	private int emAttNo;
	private String emOriginName;
	private String emChangeName;
}
