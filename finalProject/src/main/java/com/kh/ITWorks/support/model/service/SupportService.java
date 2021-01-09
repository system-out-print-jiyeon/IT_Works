package com.kh.ITWorks.support.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.support.model.vo.WorkSupport;

public interface SupportService {
	
//	1. 업무협업 작성
	int insertWorkSupport(WorkSupport ws);
	int insertSupportAttach(WorkSupport ws);
//	2. 업무협업 수정
	int updateWorkSupport(WorkSupport ws);
	int updateSupportAttach(WorkSupport ws);
	WorkSupport selectAttach(WorkSupport ws);
//	3. 업무협업 삭제
	int deleteAttach(int supportNo);
	int deleteWorkSupport(int supportNo);
//	4. 업무협업 리스트 조회 (부서)
	int selectListCount(String deptCode);
	ArrayList<WorkSupport> selectListWorkSupport(PageInfo pi, String deptCode);
//	5. 업무협업 상세 조회
	WorkSupport selectWorkSupport(int supportNo);
//	6. 업무협업 검색
	int selectListCountforSearch(HashMap<String, String> hm);
	ArrayList<WorkSupport> searchSupportList(PageInfo pi, HashMap<String, String> hs);
//	7. 나의 업무협업 조회
	int selectmyListCount(int mno);
	ArrayList<WorkSupport> selectListWorkSupport(PageInfo pi, int mno);

}
