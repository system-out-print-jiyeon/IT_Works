package com.kh.ITWorks.addressbook.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ITWorks.addressbook.model.dao.AddressDao;
import com.kh.ITWorks.addressbook.model.vo.AddressBook;
import com.kh.ITWorks.common.model.vo.PageInfo;

@Service
public class AddressServiceImpl implements AddressService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AddressDao aDao;
	
	
	@Override
	public int selectAddressPersonListCount() {
		return aDao.selectAddressPersonListCount(sqlSession);
	}
	@Override
	public ArrayList<AddressBook> selectAddressPersonList(PageInfo pi) {
		return aDao.selectAddressPersonList(sqlSession, pi);
	}
	@Override
	public int selectAddressPublicListCount() {
		return aDao.selectAddressPublicListCount(sqlSession);
	}
	@Override
	public ArrayList<AddressBook> selectAddressPublicList(PageInfo pi) {
		return aDao.selectAddressPublicList(sqlSession, pi);
	}
	@Override
	public int insertAddress(AddressBook a) {
		return aDao.insertAddress(sqlSession, a);
	}
	@Override
	public int deleteAddress(int ano) {
		return aDao.deleteAdress(sqlSession, ano);
	}
}
