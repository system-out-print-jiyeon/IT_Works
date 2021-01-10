package com.kh.ITWorks.addressbook.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ITWorks.addressbook.model.vo.AddressBook;
import com.kh.ITWorks.common.model.vo.PageInfo;

@Repository
public class AddressDao {

	public int selectAddressPersonListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("addressMapper.selectPersonListCount");
	}

	public ArrayList<AddressBook> selectAddressPersonList(SqlSessionTemplate sqlSession, PageInfo pi, int addWriter) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("addressMapper.selectAddressPersonList", addWriter, rowBounds);
	}

	public int selectAddressPublicListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("addressMapper.selectPublicListCount");
	}

	public ArrayList<AddressBook> selectAddressPublicList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("addressMapper.selectAddressPublicList", null, rowBounds);
	}

	public int insertAddress(SqlSessionTemplate sqlSession, AddressBook a) {
		return sqlSession.insert("addressMapper.insertAddress", a);
	}

	public int deleteAdress(SqlSessionTemplate sqlSession, int ano) {
		return sqlSession.update("addressMapper.deleteAddress", ano);
	}

	public ArrayList<AddressBook> selectAddressPerList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("addressMapper.selectAddressPerList");
	}


	
	public ArrayList<AddressBook> selectAddressPubList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("addressMapper.selectAddressPubList");
	}


	
	
	public int deleteAddress(SqlSessionTemplate sqlss, int ano) {
		
		return sqlss.update("addressMapper.deleteAddress", ano);
	}


}
