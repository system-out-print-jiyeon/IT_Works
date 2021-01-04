package com.kh.ITWorks.reservation.model.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.common.template.Pagination;
import com.kh.ITWorks.member.model.vo.Member;
import com.kh.ITWorks.reservation.model.service.ReservationService;
import com.kh.ITWorks.reservation.model.vo.Reservation;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService rs;
	
	
	/**
	 * 회의실 예약 조회
	 * @param floor
	 * @param mv
	 * @return
	 */
	@RequestMapping("reservation.re")
	public String selectReservationView(int floor, Model m) {
		
		
		
		m.addAttribute("floor", String.valueOf(floor));
		
		
		return "reservation/reservationViewPage";
	}
	
	@ResponseBody
	@RequestMapping(value = "ajaxselect.re", produces = "application/json; charset=utf-8")
	public String selectReservationList(int floor, String date) {
		
		return new Gson().toJson(rs.selectFloorReservation(floor, date));
		
	}
	
	@ResponseBody
	@RequestMapping(value = "checkRV.ajax", produces = "application/json; charset=utf-8")
	public String ajaxCheckReservation(@RequestBody HashMap<String, Object> hs) {
		
		// 일치하는 예약정보 조회
		if(((String)hs.get("time")).equals("9:")) {
			hs.put("time", "09");
		}
		String date = (String)hs.get("date");
		hs.put("date", date.replace("-", "/"));
		
		Reservation re = rs.ajaxCheckReservation(hs);
		
		return new Gson().toJson(re);
	}
	
	
	@RequestMapping("viewReservation.re")
	public String selectReservationViewPopup(int rno, Model m) {
		
		Reservation re = rs.selectReservation(rno);
		m.addAttribute("re", re);
		return "reservation/reservationDetailViewPopup";
	}
	
	
	@RequestMapping("insertReservation.re")
	public String insertReservationPopup(int floor, Model m) {
		
		m.addAttribute("floor", floor);
		return "reservation/reservationInsertPopup";
		
	}
	
	@ResponseBody
	@RequestMapping(value="insert.re")
	public int insertReservation(Reservation r) {
		
		// 중복방지
		int result = 0;
		if(rs.checkReservation(r).isEmpty()) {
			result = rs.insertReservation(r);
		}
		return result;
		
	}
	
	@RequestMapping("updateReservation.re")
	public String updateReservationForm(int rno, Model m) {
		
		Reservation re = rs.selectReservation(rno);
		m.addAttribute("re", re);
		return "reservation/reservationUpdatePopup";
		
	}
	
	@ResponseBody
	@RequestMapping("update.re")
	public int updateReservation(Reservation r) {
//		System.out.println(r);
		
		int result = 0;
		if(rs.checkReservation(r).isEmpty()) {
			result = rs.updateReservation(r);
			
		}
		return result;
	}
	
	@RequestMapping("myreservation.re")
	public String myReservationView(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model m, HttpSession ss) {
		
		int mno = ((Member)ss.getAttribute("loginUser")).getMemNo();

		int listcount = rs.selectListCount(mno);
		PageInfo pi = Pagination.getPageInfo(listcount, currentPage, 5, 2);
		ArrayList<Reservation> list = rs.selectListReservation(pi, mno);
		
		m.addAttribute("list", list);
		m.addAttribute("pi", pi);
		
		return "reservation/myReservationView";
		
	}
	
	@ResponseBody
	@RequestMapping("delete.re")
	public int deleteReservation(int rno) {
		
		return rs.deleteReservation(rno);
		
	}
	
	


}
