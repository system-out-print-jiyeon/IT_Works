package com.kh.ITWorks.addressbook.model.service;

import java.util.ArrayList;

import com.kh.ITWorks.addressbook.model.vo.AddressBook;
import com.kh.ITWorks.common.model.vo.PageInfo;

public interface AddressService {

	// 1. 개인주소록 리스트 조회용 서비스
    int selectAddressPersonListCount();
    ArrayList<AddressBook> selectAddressPersonList(PageInfo pi, int addWriter);
    
    // 2. 공용주소록 리스트 조회용 서비스
    int selectAddressPublicListCount();
    ArrayList<AddressBook> selectAddressPublicList(PageInfo pi);
    
    // 3. 주소록 작성용 서비스
    int insertAddress(AddressBook a);
    
    // 4. 주소록 삭제용 서비스
    int deleteAddress(int ano);
    
    // 5. 개인주소록 빠른등록 리스트 조회용 서비스
	ArrayList<AddressBook> selectAddressPerList();
	
	// 6. 공용주소록 빠른등록 리스트 조회용 서비스
	ArrayList<AddressBook> selectAddressPubList();

}
