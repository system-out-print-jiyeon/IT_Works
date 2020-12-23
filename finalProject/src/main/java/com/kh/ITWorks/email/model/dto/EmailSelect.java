package com.kh.ITWorks.email.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// select용
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class EmailSelect {
    private int emNo;
    private String emFrom;
   	private String emTitle;
    private String emContent;
    private String emEnrollDate;
    private String emInp;
    private String emStatus;
}

