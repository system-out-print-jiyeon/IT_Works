package com.kh.ITWorks.support.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.support.model.dao.SupportDao;
import com.kh.ITWorks.support.model.vo.WorkSupport;

@Service
public class SupportServiceImpl implements SupportService{
	
	@Autowired
	private SupportDao sd;
	@Autowired
	private SqlSessionTemplate sqlss;
	

	@Override
	public int insertWorkSupport(WorkSupport ws) {
		return sd.insertWorkSupport(ws, sqlss);
	}

	@Override
	public int updateWorkSupport(WorkSupport ws) {
		return sd.updateWorkSupport(ws, sqlss);
	}

	@Override
	public int deleteWorkSupport(int supportNo) {
		return sd.deleteWorkSupport(supportNo, sqlss);
	}

	@Override
	public int selectListCount(String deptCode) {
		return sd.selectListCount(deptCode, sqlss);
	}

	@Override
	public ArrayList<WorkSupport> selectListWorkSupport(PageInfo pi, String deptCode) {
		return sd.selectListWorkSupport(pi, deptCode, sqlss);
	}

	@Override
	public WorkSupport selectWorkSupport(int supportNo) {
		return sd.selectWorkSupport(supportNo, sqlss);
	}

	@Override
	public int insertSupportAttach(WorkSupport ws) {
		return sd.insertSupportAttach(ws, sqlss);
	}

	@Override
	public ArrayList<WorkSupport> searchSupportList(PageInfo pi, HashMap<String, String> hs) {
		return sd.searchSupportList(pi, hs, sqlss);
	}
	
	@Override
	public int selectListCountforSearch(HashMap<String, String> hs) {
		return sd.selectListCountforSearch(hs, sqlss);
	}

	@Override
	public int updateSupportAttach(WorkSupport ws) {
		return sd.updateSupportAttach(ws, sqlss);
	}

	@Override
	public WorkSupport selectAttach(WorkSupport ws) {
		return sd.selectAttach(ws, sqlss);
	}

	@Override
	public int deleteAttach(int supportNo) {
		return sd.deleteAttach(supportNo, sqlss);
	}

	@Override
	public int selectmyListCount(int mno) {
		return sd.selectmyListCount(mno, sqlss);
	}

	@Override
	public ArrayList<WorkSupport> selectListWorkSupport(PageInfo pi, int mno) {
		return sd.selectListWorkSupport(pi, mno, sqlss);
	}

}
