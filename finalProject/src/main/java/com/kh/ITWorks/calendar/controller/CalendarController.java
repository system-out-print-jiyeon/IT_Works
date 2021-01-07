package com.kh.ITWorks.calendar.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.ITWorks.calendar.model.service.CalendarService;
import com.kh.ITWorks.calendar.model.vo.Calendar;

@Controller
public class CalendarController {
	
	@Autowired
	private CalendarService caService;
	
	// 개인일정 조회
	@RequestMapping("calendar.ca")
	public String calendarView(int memNo, Model model) {
		
		ArrayList<Calendar> list = caService.selectCalendarList(memNo);

		model.addAttribute("list", list);
		return "calendar/calendarView";
	}
	
	// 부서일정 조회
	@RequestMapping("calendarDept.ca")
	public String calendarDeptView(String deptName, Model model) {
		
		ArrayList<Calendar> list = caService.selectCalendarDeptList(deptName);
		
		model.addAttribute("list", list);
		return "calendar/calendarDeptView";
		
	}
	
	// 사내일정 조회
	@RequestMapping("calendarComp.ca")
	public String calendarCompView(Model model) {
		
		ArrayList<Calendar> list = caService.selectCalendarCompList();
		
		model.addAttribute("list", list);
		return "calendar/calendarCompView";
	}
	
	// 일정 추가
	@RequestMapping("insert.ca")
	public String insertCalendar(Calendar ca, Model model) {

		if(ca.getCalTime() == null) { // 체크를 안했을 때 N을 넣어줌 -> 체크 했을 때는 Y가 넘어옴 
			ca.setCalTime("N");
		}
		
		int result = caService.insertCalendar(ca);
		
		
		System.out.println(ca.getDeptName());
		
		if(result > 0) {
			
			if(ca.getCalRange().equals("개인")) {
				
				model.addAttribute("cal", "개인일정 등록을하였습니다.");
				return "calendar/calendarResultPage"; // 일정을 개인으로 추가했을 때
				
			}else if(ca.getCalRange().equals("부서")) {
				model.addAttribute("calDept", "부서일정 등록을하였습니다.");
				return "calendar/calendarResultPage"; // 일정을 부서로 추가했을 때

			}else {
				model.addAttribute("calComp", "사내일정 등록을하였습니다.");
				return "calendar/calendarResultPage"; // 일정을 사내로 추가했을 때

			}
			
		}else {
			model.addAttribute("fail", "일정 등록을 실패하였습니다. 다시 시도해 주세요");
			return "calendar/calendarResultPage";
		}
	}
}
