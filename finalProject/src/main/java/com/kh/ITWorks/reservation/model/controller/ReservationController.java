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
		
		ArrayList<Reservation> list = rs.selectFloorReservation(floor);
		
		m.addAttribute("floor", String.valueOf(floor));
		m.addAttribute("list", list);
		
		return "reservation/reservationViewPage";
	}
	
	@ResponseBody
	@RequestMapping(value = "checkRV.ajax", produces = "application/json; charset=utf-8")
	public String ajaxCheckReservation(@RequestBody HashMap<String, Object> hs) {
		
		// 일치하는 예약정보 조회
		if(((String)hs.get("time")).equals("9:")) {
			hs.put("time", "9");
		}
		
		Reservation re = rs.ajaxCheckReservation(hs);
		
		System.out.println(new Gson().toJson(re));
		
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
	
	@RequestMapping("insert.re")
	public String insertReservation(Reservation r, HttpSession ss) {
		
		System.out.println(r);
		// 서버 재시작한담에 출력문 실행해보기 (이거 안하고잣음)
		//ss.setAttribute("alertMsg", "회의실 예약 완료");
		
		return "";
		
	}
	
	


}
