package com.kh.ITWorks.email.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.email.model.dao.EmailDao;
import com.kh.ITWorks.email.model.dto.EmailSelect;

	

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private EmailDao emDao;
	
	
	@Override
	public int selectEmailFromListCount(String email) {
		return emDao.selectEmailFromListCount(sqlSession, email);
	}
	@Override
	public ArrayList<EmailSelect> selectEmailFromList(PageInfo pi, String email) {

		return emDao.selectEmailFromList(sqlSession, pi, email);

	}

}
