package com.kh.ITWorks.support.model.service;

import java.util.ArrayList;

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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateWorkSupport(WorkSupport ws) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteWorkSupport(int supportNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<WorkSupport> selectListWorkSupport(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public WorkSupport selectWorkSupport(int supportNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
