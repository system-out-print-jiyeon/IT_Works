package com.kh.ITWorks.addressbook.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.ITWorks.addressbook.model.service.AddressService;
import com.kh.ITWorks.addressbook.model.vo.AddressBook;
import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.common.template.Pagination;

@Controller
public class AddressController {

	@Autowired
	private AddressService adService;
	
	@RequestMapping("Personlist.ad")
	public String selectAddressPersonList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
										Model model) {
		
		int listCount = adService.selectAddressPersonListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<AddressBook> list = adService.selectAddressPersonList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "addressbook/addressPersonListView";
		
	}
	
	@RequestMapping("Publiclist.ad")
	public String selectAddressPublicList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
										Model model) {
		
		int listCount = adService.selectAddressPublicListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<AddressBook> list = adService.selectAddressPublicList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
	return "addressbook/addressPublicListView";
		
	}
	
	@RequestMapping("enrollForm.ad")
	public String address() {
		return "addressbook/addressEnrollForm";
	}

	@RequestMapping("delete.ad")
	public int deleteFreeBoard(int ano) {
		return adService.deleteAddress(ano);
	}
}