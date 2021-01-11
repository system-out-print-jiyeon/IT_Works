package com.kh.ITWorks.calendar.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
		
		// 마감일이 시작일 보다 더 빠른 날일 경우 시작일 마감일 데이터를 바꿔 저장해줌
		if(ca.getCalStartDate().compareTo(ca.getCalEndDate()) > 0) {
			String changeDate = "";
			
			changeDate = ca.getCalStartDate();
			
			ca.setCalStartDate(ca.getCalEndDate());
			ca.setCalEndDate(changeDate);
			
		}

		if(ca.getCalTime() == null) { // 체크를 안했을 때 N을 넣어줌 -> 체크 했을 때는 Y가 넘어옴 
			ca.setCalTime("N");
		}
		
		int result = caService.insertCalendar(ca);
		
		if(result > 0) {
			
			if(ca.getCalRange().equals("개인")) {
				model.addAttribute("resultCal", "개인일정 등록을 완료였습니다.");
				return "calendar/calendarResultPage"; // 일정을 개인으로 추가했을 때
				
			}else if(ca.getCalRange().equals("부서")) {
				model.addAttribute("resultCalDept", "부서일정 등록을 완료하였습니다.");
				return "calendar/calendarResultPage"; // 일정을 부서로 추가했을 때

			}else {
				model.addAttribute("resultCalComp", "사내일정 등록을 완료하였습니다.");
				return "calendar/calendarResultPage"; // 일정을 사내로 추가했을 때

			}
			
		}else {
			model.addAttribute("fail", ca.getCalRange() + "일정 등록을 실패하였습니다. 다시 시도해 주세요");
			return "calendar/calendarResultPage";
		}
	}
	
	// 일정 삭제
	@RequestMapping("delete.ca")
	public String deleteCalendar(int calNo, int memNo, String calRange, Model model) {
		Calendar ca = new Calendar();
		ca.setCalNo(calNo);
		ca.setMemNo(memNo);
		
		int result = caService.deleteCalendar(ca);
		
		if(result > 0) {
			
			if(calRange.equals("개인")) {
				model.addAttribute("resultCal", "개인일정 삭제를 완료였습니다.");
				return "calendar/calendarResultPage"; // 일정을 개인으로 추가했을 때
				
			}else if(calRange.equals("부서")) {
				model.addAttribute("resultCalDept", "부서일정 삭제를 완료하였습니다.");
				return "calendar/calendarResultPage"; // 일정을 부서로 추가했을 때

			}else {
				model.addAttribute("resultCalComp", "사내일정 삭제를 완료하였습니다.");
				return "calendar/calendarResultPage"; // 일정을 사내로 추가했을 때

			}
		}else {
			model.addAttribute("fail", calRange + "일정 삭제를 실패하였습니다. 다시 시도해 주세요");
			return "calendar/calendarResultPage";
		}
		
	}
	
	// 일정 수정
	@RequestMapping("update.ca")
	public String updateCalendar(Calendar ca, Model model) {
		
		if(ca.getCalTime() == null) {
			ca.setCalTime("N");
		}
		
		// 마감일이 시작일 보다 더 빠른 날일 경우 시작일 마감일 데이터를 바꿔 저장해줌
		if(ca.getCalStartDate().compareTo(ca.getCalEndDate()) > 0) {
			String changeDate = "";
			
			changeDate = ca.getCalStartDate();
			
			ca.setCalStartDate(ca.getCalEndDate());
			ca.setCalEndDate(changeDate);
			
		}
		
		int result = caService.updateCalendar(ca);
		
		if(result > 0) {
			if(ca.getCalRange().equals("개인")) {
				model.addAttribute("resultCal", "개인일정 수정을 완료였습니다.");
				return "calendar/calendarResultPage"; // 일정을 개인으로 추가했을 때
				
			}else if(ca.getCalRange().equals("부서")) {
				model.addAttribute("resultCalDept", "부서일정 수정을 완료하였습니다.");
				return "calendar/calendarResultPage"; // 일정을 부서로 추가했을 때

			}else {
				model.addAttribute("resultCalComp", "사내일정 수정을 완료하였습니다.");
				return "calendar/calendarResultPage"; // 일정을 사내로 추가했을 때

			}
		}else {
			model.addAttribute("fail", ca.getCalRange() + "일정 수정을 실패하였습니다. 다시 시도해 주세요");
			return "calendar/calendarResultPage";
		}

	}
	
	
	// 메인화면 개인일정 조회
	@RequestMapping("selectMain.ca") 
	public String mainPageCalendarView(int memNo, Model model) {
		
		ArrayList<Calendar> calendarList = caService.selectCalendarList(memNo);

		model.addAttribute("calendarList", calendarList); 
		
		return "mainPage2"; 
	}
	

	// 일정 수정
	@RequestMapping("updateMain.ca")
	public String updateMainCalendar(Calendar ca, Model model) {
		
		System.out.println(ca);
		
		if(ca.getCalTime() == null) {
			ca.setCalTime("N");
		}
		
		// 마감일이 시작일 보다 더 빠른 날일 경우 시작일 마감일 데이터를 바꿔 저장해줌
		if(ca.getCalStartDate().compareTo(ca.getCalEndDate()) > 0) {
			String changeDate = "";
			
			changeDate = ca.getCalStartDate();
			
			ca.setCalStartDate(ca.getCalEndDate());
			ca.setCalEndDate(changeDate);
			
		}
		
		int result = caService.updateCalendar(ca);
		
		if(result > 0) {

				model.addAttribute("mianCal", "개인일정 수정을 완료였습니다.");
				return "calendar/mainPageCalendar"; // 일정을 개인으로 추가했을 때
		}else {
				model.addAttribute("mianCal", "개인일정 수정을 실패하였습니다. 다시 시도해 주세요");
				return "calendar/mainPageCalendar"; // 일정을 개인으로 추가했을 때
		}

	}
 
	
	// 일정 삭제
	@RequestMapping("deleteMain.ca")
	public String deleteMainCalendar(int calNo, int memNo, String calRange, Model model) {
		Calendar ca = new Calendar();
		ca.setCalNo(calNo);
		ca.setMemNo(memNo);
		
		int result = caService.deleteCalendar(ca);
		
		if(result > 0) {

			model.addAttribute("mianCal", "개인일정 삭제를 완료였습니다.");
			return "calendar/mainPageCalendar"; // 일정을 개인으로 추가했을 때

		}else {
			model.addAttribute("mianCal", calRange + "일정 삭제를 실패하였습니다. 다시 시도해 주세요");
			return "calendar/mainPageCalendar";
		}
		
	}
	
	
}
