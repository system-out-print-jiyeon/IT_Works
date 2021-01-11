package com.kh.ITWorks.addressbook.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.ITWorks.addressbook.model.service.AddressService;
import com.kh.ITWorks.addressbook.model.vo.AddressBook;
import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.common.template.Pagination;
import com.kh.ITWorks.member.model.vo.Member;

@Controller
public class AddressController {

	@Autowired
	private AddressService adService;
	
	@RequestMapping("personlist.ad")
	public String selectAddressPersonList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
										Model model, HttpSession session) {
		
		Member mem = (Member) session.getAttribute("loginUser");
		int adUser = mem.getMemNo();
		
		int listCount = adService.selectAddressPersonListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 15, 10);
		ArrayList<AddressBook> peList = adService.selectAddressPersonList(pi, adUser);
		
		model.addAttribute("pi", pi);	
		
		model.addAttribute("peList", peList);
		
		return "addressbook/addressPersonListView";
		
	}
	
	@RequestMapping("publiclist.ad")
	public String selectAddressPublicList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
										Model model) {
		
		int listCount = adService.selectAddressPublicListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 15, 10);
		ArrayList<AddressBook> puList = adService.selectAddressPublicList(pi);
					
		model.addAttribute("pi", pi);					
		model.addAttribute("puList", puList);
		
	return "addressbook/addressPublicListView";
		
	}
	
	@RequestMapping("enrollForm.ad")
	public String address() {
		return "addressbook/addressEnrollForm";
	}

	@RequestMapping("insert.ad")
	public String insertAddress(AddressBook a, HttpSession session, Model model) {
		
		String str = a.getAddCategory();
		String str1 = a.getAddSpot();
		String str2 = a.getAddDepartment();
		
		if(str2 != null) {
		
			if(str2.contains("개발")) {				
				str2 = "D1";
			}else if(str2.contains("인사")) {
				str2 = "D2";
			}else if(str2.contains("경영지원")) {
				str2 = "D3";
			}else if(str2.contains("기획")) {
				str2 = "D4";
			}else if(str2.contains("총무")) {
				str2 = "D5";
			}
		}
		a.setAddDepartment(str2);
			
		if(str1 != null)	{		
		switch(str1) {
	      case "대표이사": str1 = "J7"; break;
	      case "이사": str1 = "J6"; break;
	      case "부사": str1 = "J5"; break;
	      case "차장": str1 = "J4"; break;
	      case "과장": str1 = "J3"; break;
	      case "대리": str1 = "J2"; break;
	      case "사원": str1 = "J1"; break;
	      case "계약직": str1 = "J0"; break;
	      
	      }
		}
		
		
		a.setAddSpot(str1);
		
		int result = adService.insertAddress(a);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 주소록이 등록되었습니다");
			if(str.equals("public")) {
				
				return "redirect:publiclist.ad";
			}else {
				return "redirect:personlist.ad";
			}
		}else {
			model.addAttribute("errorMsg", "주소록 등록 실패");
			return "common/errorPage";			
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="adpelist.ad", produces="application/json; charset=utf-8")
	public String selectAddressPerList() {
		
		ArrayList<AddressBook> list = adService.selectAddressPerList();
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("quick.ad")
	public String selectAddressPerson(AddressBook a) {
		
		int result = adService.insertAddress(a);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="adpulist.ad", produces="application/json; charset=utf-8")
	public String selectAddressPubList() {
		
		ArrayList<AddressBook> list = adService.selectAddressPubList();
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("quick.ad1")
	public String selectAddressPublic(AddressBook a) {
		
		int result = adService.insertAddress(a);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	@ResponseBody
	@RequestMapping("delete.ad")
	public int deletePublicAdd(int addNo) {
		
		return adService.deleteAddress(addNo);
		
	}
	
}