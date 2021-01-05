package com.kh.ITWorks.support.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ITWorks.support.model.vo.WorkSupport;

@Repository
public class SupportDao {
	
	public int insertWorkSupport(WorkSupport ws, SqlSessionTemplate sqlss) {
		return sqlss.insert("supportMapper.insertWorkSupport", ws);
	}
	
	
	public int insertSupportAttach(WorkSupport ws, SqlSessionTemplate sqlss) {
		return sqlss.insert("supportMapper.insertSupportAttach", ws);
	}

}
