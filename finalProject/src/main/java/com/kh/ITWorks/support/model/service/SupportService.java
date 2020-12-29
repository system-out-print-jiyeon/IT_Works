package com.kh.ITWorks.support.model.service;

import java.util.ArrayList;

import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.support.model.vo.WorkSupport;

public interface SupportService {
	
//	1. 업무협업 작성
	int insertWorkSupport(WorkSupport ws);
//	2. 업무협업 수정
	int updateWorkSupport(WorkSupport ws);
//	3. 업무협업 삭제
	int deleteWorkSupport(int supportNo);
//	4. 업무협업 리스트 조회
	int selectListCount();
	ArrayList<WorkSupport> selectListWorkSupport(PageInfo pi);
//	5. 업무협업 상세 조회
	WorkSupport selectWorkSupport(int supportNo);

}
