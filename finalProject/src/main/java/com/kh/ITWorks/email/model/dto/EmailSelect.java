package com.kh.ITWorks.email.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// 이메일 select용
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class EmailSelect {
    private int emNo;				// 고유번호
    private String emFrom;			// 보낸사람 이메일
   	private String emTitle;			// 이메일 제목
    private String emContent;		// 이메일 내용
    private String emEnrollDate;	// 보낸날짜
    private String emInp;			// 중요메일여부
    private String emStatus;		// 삭제여부
    private String emTo; 			// 보낸사람 입장에서는 받은사람들
    
    // 받은 메일 추가 변수
    private int emRecNo;
    private String emRead;
    
    // db에는 없는 속성
    private int att;				// 첨부파일이 존재하는지 알기 위한 변수 (count로 조회해서 1이상이면 첨부파일 존재)
    
    // 전체  메일 select시 보낸메일인지 받은메일인지 구분하기위한 변수
    private String emCheck; 		// emailFrom은 보낸메일 / emailTo는 받은메일

}

