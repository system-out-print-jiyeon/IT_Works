package com.kh.ITWorks.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.common.template.Pagination;
import com.kh.ITWorks.member.model.service.MemberService;
import com.kh.ITWorks.member.model.vo.Member;

@Controller
public class MemberController {
	
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;
	
	
	@RequestMapping("manageList.ma")
	public String selectManageList(@RequestParam(value="currentPage", defaultValue="1")int currentPage, Model model) {
		
		int listCount = mService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Member> list = mService.selectManageList(pi);
		
		model.addAttribute("count", listCount);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "member/manage_list";
	}
	
	@RequestMapping("detail.ma")
	public String detailView(int memNo, Model model) {
		
		Member m = mService.detailView(memNo);
		
		model.addAttribute("m", m);
		
		//System.out.println(m);
		
		return "member/manage_detailForm";
	}
	
	@RequestMapping("orgTree.ma")
	public String orgTree() {
		
		return "member/manage_orgTree";
	}
	
	@RequestMapping("listManage.ma")
	public String listManage(@RequestParam(value="currentPage", defaultValue="1")int currentPage, Model model) {
		
		int listCount = mService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Member> list = mService.selectManageList(pi);
		
		model.addAttribute("count", listCount);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "member/manage_manageList";
	}
	
	@RequestMapping("enrollForm.ma")
	public String enrollForm() {
		return "member/manage_enrollForm";
	}
	
	@RequestMapping("memberEnroll.ma")
	public String memberEnroll(Member m, Model model, HttpSession session, MultipartFile profile) {
		//System.out.println(m);
		//System.out.println("암호화 전에 암호 체크용 - " + m.getMemPwd());
		//System.out.println("프로필 이미지 체크용 : " + profile.getOriginalFilename());
		
		if(!profile.getOriginalFilename().equals("")) {
			String changeName = profileSave(session,profile);
			
			m.setMemImg("resources/profileImgs/" + changeName);
			//System.out.println("프로필 이미지 이름변환 체크용 : " + changeName);
		}
		
		String encPwd = pwdEncoder.encode(m.getMemPwd());
		//System.out.println(encPwd);
		m.setMemPwd(encPwd);
		
		int result = mService.memberEnroll(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "사원등록 성공!");
			return "redirect:manageList.ma";
		}else {
			return "common/errorPage";
		}
	}
	
	public String profileSave(HttpSession session, MultipartFile profile) {
		String profilePath = session.getServletContext().getRealPath("/resources/profileImgs/");
		
		String originName = profile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int randomFormat = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + randomFormat + ext;
		
		try {
			profile.transferTo(new File(profilePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	@ResponseBody
	@RequestMapping("idCheck.ma")
	public String idCheck(String memId) {
		int count = mService.idCheck(memId);
		return String.valueOf(count);	
	}
	
	@RequestMapping("search.ma")
	public String searchList(@RequestParam(value="currentPage", defaultValue="1")int currentPage, 
												Model model, String selectList, String keyword) {
		System.out.println(selectList);
		System.out.println(keyword);
		
		int searchCount = mService.searchListCount(selectList,keyword);
		System.out.println("검색결과 갯수 : " + searchCount);
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 10, 10);
		ArrayList<Member> list = mService.selectSearch(selectList,keyword,pi);
		
		System.out.println(list);
		
		model.addAttribute("count", searchCount);
		model.addAttribute("list", list);
		
		return "member/manage_list";
	}
	
	@RequestMapping("searchM.ma")
	public String searchManageList(@RequestParam(value="currentPage", defaultValue="1")int currentPage, 
												Model model, String selectList, String keyword) {
		System.out.println(selectList);
		System.out.println(keyword);
		
		int searchCount = mService.searchListCount(selectList,keyword);
		System.out.println("검색결과 갯수 : " + searchCount);
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 10, 10);
		ArrayList<Member> list = mService.selectSearch(selectList,keyword,pi);
		
		System.out.println(list);
		
		model.addAttribute("count", searchCount);
		model.addAttribute("list", list);
		
		return "member/manage_manageList";
	}
	
	@RequestMapping("updateForm.ma")
	public String updateForm(int memNo, Model model) {
		Member m = mService.detailView(memNo);
		
		model.addAttribute("m", m);
		
		//model.addAttribute("m", mService.detailView(memNo)); --> 이렇게도 변형 가능
		
		return "member/manage_updateForm";
	}
	
	@RequestMapping("update.ma")
	public String memberUpdate(Member m, Model model, HttpSession session, MultipartFile reprofile ) {
		System.out.println("첨부파일 잘 넘어오나 결과 --> " + reprofile.getOriginalFilename());
		System.out.println("첨부파일 수정없이 기존 값 받아오기 --->" + m.getMemImg());
		if(!reprofile.getOriginalFilename().equals("")) {
			if(m.getMemImg() != null) {
				new File(session.getServletContext().getRealPath(m.getMemImg())).delete();
			}
			
			String changeName = profileSave(session, reprofile);
			m.setMemImg("resources/profileImgs/" + changeName);
		}
		System.out.println("첨부파일 통과" + reprofile.getOriginalFilename());
		
		int result = mService.memberUpdate(m);
		
		System.out.println(result);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "사원 정보 수정 성공 :)");
			return "redirect:listManage.ma";
		}else {
			model.addAttribute("errorMsg", "사원 정보 수정 실패 :(");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("delete.ma")
	public String memberDelete(String deletePwd, int delNo, String delId, HttpSession session, Model model) {
		//모달에서 값이 제대로 넘어오나 테스트용
		System.out.println("삭제하려는 사원 번호 : " + delNo);
		System.out.println("로그인한 사원 아이디 : " + delId);
		System.out.println("입력받은 비밀번호(평문) : " + deletePwd);
		//System.out.println("로그인 한 사원의 비밀번호 : " + delPwd);	
		
		// 아이디 조회로 로그인사원의 패스워드 가져오기
		String pass = mService.getPass(delId);
		
		System.out.println("삭제 권한 있는 사원의 비밀번호 : " + pass);
		
		if(pwdEncoder.matches(deletePwd, pass)) {
			System.out.println("비밀번호 일치 --> 삭제");
			
			int result = mService.deleteMember(delNo);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "사원 정보 삭제에 성공했습니다!");
				return "redirect:/listManage.ma";
			}else {
				session.setAttribute("alertMsg", "사원 정보 삭제에 실패했습니다.");
				return "redirect:/";
			}
		}else {
			System.out.println("비밀번호 불일치 --> 삭제 불가");
			session.setAttribute("alertMsg", "비밀번호가 일치 하지 않습니다!");
			return "redirect:/listManage.ma";
		}		
	}
	
}
