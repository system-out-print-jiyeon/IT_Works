package com.kh.ITWorks.attendance.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.ITWorks.attendance.model.service.AttendanceService;
import com.kh.ITWorks.attendance.model.vo.AnnualLeave;
import com.kh.ITWorks.attendance.model.vo.BusinessTrip;
import com.kh.ITWorks.attendance.model.vo.WorkDay;
import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.common.template.Pagination;
import com.kh.ITWorks.member.model.vo.Member;

@Controller
public class AttendanceController {

	@Autowired
	private AttendanceService aService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@RequestMapping("login.at")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = aService.loginMember(m);  
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemPwd(),(loginUser.getMemPwd()))) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("mainPage2"); 

		}else {
			mv.addObject("errorMsg", "로그인 실패! 다시 시도해주세요");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	@RequestMapping("logout.at")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "mainPage";
	}
	
	@RequestMapping("searchIdForm.at")
	public ModelAndView searchIdForm(ModelAndView mv) {
		mv.setViewName("attendance/searchIdForm");
		return mv;
	}
	
	@RequestMapping("searchId.at")
	public ModelAndView searchId(Member m, HttpSession session, ModelAndView mv) {
		Member searchId = aService.searchId(m);
		
		if(searchId != null) {
			session.setAttribute("searchId", searchId);
			mv.setViewName("attendance/searchIdSuccess");
		}else {
			mv.setViewName("attendance/searchIdFailed");
		}
		return mv;
	}
	
	@RequestMapping("searchPwdForm.at")
	public ModelAndView searchPwdForm(ModelAndView mv) {
		mv.setViewName("attendance/searchPwdForm");
		return mv;
	}
	
	@RequestMapping("searchPwd.at")
	public ModelAndView searchPwd(Member m, HttpSession session, ModelAndView mv) {
		Member searchPwd = aService.searchPwd(m);
		
		if(searchPwd != null) {
			session.setAttribute("searchPwd", searchPwd);
			mv.setViewName("attendance/resetPwdForm");
		}else {
			mv.setViewName("attendance/searchPwdFailed");
		}
		return mv;
	}
	
	
	@RequestMapping("update.at")
	public String updateMember(Member m, Model model, HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
		m.setMemPwd(encPwd);
		
		int result = aService.updateMember(m);
		
		if(result > 0) {
			session.setAttribute("searchPwd", aService.loginMember(m));
			
			return "attendance/resetPwdSuccess";
			
		}else { 
			
			model.addAttribute("errorMsg", "회원정보 수정 실패!");
			return "common/errorPage";
			
		}
	}

	
	
	
	
	
	
	
	@RequestMapping("list.bt")
	public String selectBusinessTripList(@RequestParam(value="currentPage", defaultValue="1")int currentPage, 
								Model model) {
		
		int listCount = aService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<BusinessTrip> list = aService.selectBusinessTripList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "attendance/businessTripListView";
	}
	
	
	@RequestMapping("approval.bt")
	public String approvalBusinessTrip(@RequestParam(value="currentPage", defaultValue="1")int currentPage, 
								Model model) {
		
		int listCount = aService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<BusinessTrip> list = aService.selectBusinessTripList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "attendance/approvalBusinessTrip";
	}
	
	
	
	
	
	@RequestMapping("insertForm.bt")
	public ModelAndView insertBusinessForm(ModelAndView mv) {
		mv.setViewName("attendance/submitBusinessTrip");
		return mv;
	}
	
	
	@RequestMapping("insert.bt")
	public String insertBusinessTrip(BusinessTrip bt, HttpSession session,
							Model model) {
		
		int result = aService.insertBusiness(bt);
		
		if(result > 0) { // 성공
			session.setAttribute("alertMsg", "출장신청이 성공적으로 등록되었습니다.");
			return "redirect:list.bt"; 
		}else { // 실패
			model.addAttribute("errorMsg", "출장신청 등록에 실패했습니다. 다시 시도해주세요.");
			return "common/errorPage";
		}
		
	}
	
	
	
	@RequestMapping("detail.bt")
	public String selectBusinessTrip(int btno, Model model) {
		
		int result = aService.increaseCount(btno);
		
		if(result > 0) { // 유효한 게시글
			
			BusinessTrip bt = aService.selectBusinessTrip(btno);
			
			model.addAttribute("bt", bt);
			
			return "attendance/detailBusinessTrip";
			
		}else { // 유효한 게시글 X
			model.addAttribute("errorMsg", "존재하지 않는 게시글이거나 열람할 수 없는 게시글입니다.");
			return "common/errorPage";
		}
		
	}
	
	
	
	@RequestMapping("detailApproval.bt")
	public String selectApprovalBusinessTrip(int btno, Model model) {
		
		int result = aService.increaseCount(btno);
		
		if(result > 0) { // 유효한 게시글
			
			BusinessTrip bt = aService.selectBusinessTrip(btno);
			
			model.addAttribute("bt", bt);
			
			return "attendance/detailApprovalBusinessTrip";
			
		}else { // 유효한 게시글 X
			model.addAttribute("errorMsg", "존재하지 않는 게시글이거나 열람할 수 없는 게시글입니다.");
			return "common/errorPage";
		}
		
	}


	
	@RequestMapping("clickReturn.bt")
	public String returnBusinessTrip(int apno, int btno, HttpSession session, Model model) {
		
		Map<String, Object> approval = new HashMap<String, Object>();
		approval.put("apno", apno);
		approval.put("btno", btno);

		
		int result = aService.returnBusinessTrip(approval);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "출장신청이 반려되었습니다.");
			return "redirect:approval.bt";
			
		}else {
			model.addAttribute("errorMsg", "출장신청 반려 처리 실패");
			return "common/errorPage";
		}
		
		
	}
	
	
	
	@RequestMapping("clickApproval.bt")
	public String approvalBusinessTrip(int apno, int btno, HttpSession session, Model model) {
		
		Map<String, Object> approval = new HashMap<String, Object>();
		approval.put("apno", apno);
		approval.put("btno", btno);

		
		int result = aService.approvalBusinessTrip(approval);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "휴가신청이 승인되었습니다.");
			return "redirect:approval.bt";
			
		}else {
			model.addAttribute("errorMsg", "휴가신청 승인 처리 실패");
			return "common/errorPage";
		}
		
		
	}
	

	
	
	
	
	
	

	@RequestMapping("list.an")
	public String selectAnnualLeaveList(@RequestParam(value="currentPage", defaultValue="1")int currentPage, 
								Model model) {
		
		int listCount = aService.selectListCountAL();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<AnnualLeave> anList = aService.selectAnnualLeaveList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("anList", anList);
		
		return "attendance/annualLeaveListView";
	}
	
	
	@RequestMapping("approval.an")
	public String approvalAnnualLeave(@RequestParam(value="currentPage", defaultValue="1")int currentPage, 
								Model model) {
		
		int listCount = aService.selectListCountAL();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<AnnualLeave> anList = aService.selectAnnualLeaveList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("anList", anList);
		
		return "attendance/approvalAnnualLeave";
	}
	

	@RequestMapping("insertForm.an")
	public ModelAndView insertAnnualForm(ModelAndView mv) {
		mv.setViewName("attendance/submitAnnualLeave");
		return mv;
	}
	

	@RequestMapping("insert.an")
	public String insertAnnualLeave(AnnualLeave an, HttpSession session,
							Model model) {
		
		int result = aService.insertAnnualLeave(an);
		
		if(result > 0) { // 성공
			session.setAttribute("alertMsg", "연차신청이 성공적으로 등록되었습니다.");
			return "redirect:list.an"; 
		}else { // 실패
			model.addAttribute("errorMsg", "연차신청 등록에 실패했습니다. 다시 시도해주세요.");
			return "common/errorPage";
		}
		
	}
	
	
	@RequestMapping("detail.an")
	public String selectAnnualLeave(int anno, Model model) {
		
		int result = aService.increaseCountAL(anno);
		
		if(result > 0) { // 유효한 게시글
			
			AnnualLeave an = aService.selectAnnualLeave(anno);
			
			model.addAttribute("an", an);
			
			return "attendance/detailAnnualLeave";
			
		}else { // 유효한 게시글 X
			model.addAttribute("errorMsg", "존재하지 않는 게시글이거나 열람할 수 없는 게시글입니다.");
			return "common/errorPage";
		}
		
	}
	
	
	
	@RequestMapping("detailApproval.an")
	public String selectApprovalAnnualLeave(int anno, Model model) {
		
		int result = aService.increaseCountAL(anno);
		
		if(result > 0) { // 유효한 게시글
			
			AnnualLeave an = aService.selectAnnualLeave(anno);
			
			model.addAttribute("an", an);
			
			return "attendance/detailApprovalAnnualLeave";
			
		}else { // 유효한 게시글 X
			model.addAttribute("errorMsg", "존재하지 않는 게시글이거나 열람할 수 없는 게시글입니다.");
			return "common/errorPage";
		}
		
	}

	
	@RequestMapping("clickReturn.an")
	public String returnAnnualLeave(int apno, int anno, HttpSession session, Model model) {
		
		Map<String, Object> approval = new HashMap<String, Object>();
		approval.put("apno", apno);
		approval.put("anno", anno);

		
		int result = aService.returnAnnualLeave(approval);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "연차신청이 반려되었습니다.");
			return "redirect:approval.an";
			
		}else {
			model.addAttribute("errorMsg", "연차신청 반려 처리 실패");
			return "common/errorPage";
		}
		
		
	}
	
	
	
	@RequestMapping("clickApproval.an")
	public String approvalAnnualLeave(int apno, int anno, HttpSession session, Model model, int prno) {
		
		Map<String, Object> approval = new HashMap<String, Object>();
		approval.put("apno", apno);
		approval.put("anno", anno);

		
		int result1 = aService.approvalAnnualLeave(approval);
		int result2 = aService.subtractAnnualLeave(prno);
		
		if(result1 * result2 > 0) {
			
			session.setAttribute("alertMsg", "연차신청이 승인되었습니다.");
			return "redirect:approval.an";
			
		}else {
			model.addAttribute("errorMsg", "연차신청 승인 처리 실패");
			return "common/errorPage";
		}
		
		
	}
	

	
	
	
	
	
	
	
	
	
	
	

	
	@RequestMapping("workTime.at")
	public ModelAndView workTimeView(ModelAndView mv) {
		mv.setViewName("attendance/workTimeListView");
		return mv;
	}
	


	@ResponseBody
	@RequestMapping("updateOnWork.wd")
	public String updateOnWork(WorkDay wd, String onLocation, String onTime, int memNo) {
		
		int checkWorkDay = aService.checkOnWork(wd);
		
		Map<String, Object> updatewd = new HashMap<String, Object>();
		updatewd.put("onLocation", onLocation);
		updatewd.put("onTime", onTime);
		updatewd.put("memNo", memNo);
		
		if(checkWorkDay == 0) {
			int result = aService.updateOnWork(updatewd);
			
			if(result > 0) {
				return "success";
				
			}else {
				return "fail";
			}
		}else {
			
			return "already";
		}
		
	}


	@ResponseBody
	@RequestMapping("updateLeaveWork.wd")
	public String updateLeaveWork(WorkDay wd, String leaveLocation, String leaveTime, int memNo) {
		
		int checkWorkDay = aService.checkLeaveWork(wd);
		
		
		Map<String, Object> updatewd = new HashMap<String, Object>();
		updatewd.put("leaveLocation", leaveLocation);
		updatewd.put("leaveTime", leaveTime);
		updatewd.put("memNo", memNo);
		
		if(checkWorkDay == 0) {
			int result = aService.updateLeaveWork(updatewd);
			
			
			if(result > 0) {
				return "success";
			}else {
				return "fail";
			}
		}else {
			
			return "already";
		}
		
	}

	
	
	@ResponseBody
	@RequestMapping(value="workTime.wd", produces="application/json; charset=utf-8")
	public String workDayList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, int memNo,
								Model model) {
		
		int listCount = aService.selectListCountWD(memNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<WorkDay> wdList = aService.selectWorkDayList(pi, memNo);
		
		
		model.addAttribute("pi", pi);
		model.addAttribute("wdList", wdList);
		
		return new Gson().toJson(wdList);
	}

	
	
	
	
	

	
	
}
