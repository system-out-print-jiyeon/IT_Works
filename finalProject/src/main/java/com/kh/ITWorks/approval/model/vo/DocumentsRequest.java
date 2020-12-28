package com.kh.ITWorks.approval.model.vo;

import java.util.ArrayList;

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
public class DocumentsRequest {

	private int docNo;
	private String docreqKinds;
	private String docreqUsage;
	private int docreqAmount;
	private String docreqSubmission;
	private String docreqLanguage;
	
	private ArrayList<DocumentsRequest> docreqList;

}
