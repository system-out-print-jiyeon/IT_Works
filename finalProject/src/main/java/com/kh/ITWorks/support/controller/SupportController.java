package com.kh.ITWorks.support.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.ITWorks.board.model.vo.BoardAttachment;
import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.common.template.Pagination;
import com.kh.ITWorks.member.model.vo.Member;
import com.kh.ITWorks.reservation.model.vo.Reservation;
import com.kh.ITWorks.support.model.service.SupportService;
import com.kh.ITWorks.support.model.vo.WorkSupport;

@Controller
public class SupportController {
	
	@Autowired
	private SupportService ss;
	
	
	@RequestMapping("list.sp")
	public String supportListView(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, 
								Model m, HttpSession session) {
		
		
		Member mem = (Member)session.getAttribute("loginUser");
		String deptCode = mem.getDeptCode();
		int listCount = ss.selectListCount(deptCode);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<WorkSupport> list = ss.selectListWorkSupport(pi, deptCode);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		
		return "supportBoard/supportListView";
		
	}
	
	
	@RequestMapping("insertForm.sp")
	public String supportinsertForm() {
		
		return "supportBoard/supportInsertForm";
		
	}
	
	
	@RequestMapping("insert.sp")
	public String insertSupport(WorkSupport ws, MultipartFile upfile, Model m, HttpSession session) {
		
		ws.setMem((Member)session.getAttribute("loginUser"));
		
		if(ss.insertWorkSupport(ws)>0) {
			// 첨부파일이 있는경우
			if(!upfile.getOriginalFilename().equals("")) {
				insertAttach(ws, upfile, session, m);
			}else {
				session.setAttribute("alertMsg", "글이 정상적으로 등록되었습니다.");
			}
		}else {
			m.addAttribute("alertMsg", "글이 정상적으로 등록되지 않았습니다.");
		}
		return "redirect:list.sp";
	}
	
	public String insertAttach(WorkSupport ws, MultipartFile upfile, HttpSession session, Model m) {
		
		ws.setAttach(new BoardAttachment());
		ws.getAttach().setOriginName(upfile.getOriginalFilename());
		ws.getAttach().setChangeName(savefile(session, upfile));
		ws.getAttach().setFilePath("resources/upfiles/");
		
		if(ss.insertSupportAttach(ws)>0) {
			session.setAttribute("alertMsg", "글이 정상적으로 등록되었습니다.");
		}else {
			m.addAttribute("alertMsg", "글이 정상적으로 등록되지 않았습니다.");
		}
		return "redirect:list.sp";
	}
	
	public String updateAttach(WorkSupport ws, MultipartFile reupfile, HttpSession session, Model m) {
		
		ws.setAttach(new BoardAttachment());
		ws.getAttach().setOriginName(reupfile.getOriginalFilename());
		ws.getAttach().setChangeName(savefile(session, reupfile));
		ws.getAttach().setFilePath("resources/upfiles/");
		
		if(ss.updateSupportAttach(ws)>0) {
			session.setAttribute("alertMsg", "글이 정상적으로 등록되었습니다.");
			return "redirect:detail.sp?sno="+ws.getSupportNo();
		}else {
			m.addAttribute("alertMsg", "글이 정상적으로 등록되지 않았습니다.");
			return "redirect:list.sp";
		}
		
	}
	
	
	public String savefile(HttpSession session, MultipartFile upfile) {
		
		String savepath = session.getServletContext().getRealPath("/resources/upfiles/");
		
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int random = (int)(Math.random() * 90000 + 10000);
		// 확장자 가져오기
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + random + ext;
		
		try {
			upfile.transferTo(new File(savepath + changeName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return changeName;
		
	}
	
	@RequestMapping("detail.sp")
	public String detailSupportView(int sno, Model m) {
		
		m.addAttribute("ws", ss.selectWorkSupport(sno));

		return "supportBoard/supportDetailView";
	}
	
	@RequestMapping("search.sp")
	public String searchSupportList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			String condition, String keyword, String deptCode, Model m) {
		
		HashMap<String, String> hm = new HashMap<>();
		hm.put("condition", condition);
		hm.put("keyword", keyword);
		hm.put("deptCode", deptCode);
		
		int listCount = ss.selectListCountforSearch(hm);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<WorkSupport> list = ss.searchSupportList(pi, hm);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		
		return "supportBoard/supportListView";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "ajaxCategorySort.go", produces = "application/json; charset=utf-8")
	public String ajaxCategorySort(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
									String category, String deptCode) {
		
		HashMap<String, String> hm = new HashMap<>();
		hm.put("deptCode", deptCode);
		hm.put("category", category);
		
		int listCount = ss.selectListCountforSearch(hm);
		
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<WorkSupport> list = ss.searchSupportList(pi, hm);
		
		return new Gson().toJson(list);
		
	}
	
	
	@RequestMapping("updateForm.sp")
	public String supportUpdateForm(int sno, Model m) {
		
		m.addAttribute("ws", ss.selectWorkSupport(sno));
		
		return "supportBoard/supportUpdateForm";
		
	}
	
	
	@RequestMapping("update.sp")
	public String supportUpdate(WorkSupport ws, MultipartFile reupfile, Model m, HttpSession session) {
		
		
		if(ss.updateWorkSupport(ws)>0) {
			
			if(!reupfile.getOriginalFilename().equals("")) {
				// 첨부파일테이블에 기존 파일이 있는지 조회
				WorkSupport ws2 = ss.selectAttach(ws);
				// 기존 파일이 있음 -> 업데이트
				if(ws2 != null) {
					// 파일삭제
					
					new File(session.getServletContext().getRealPath(ws2.getAttach().getFilePath()+
							ws2.getAttach().getChangeName())).delete();
					
					updateAttach(ws2, reupfile, session, m);
				}else {
					// 기존파일이 없음 -> 인서트
					insertAttach(ws, reupfile, session, m);
				}
			}else {
				session.setAttribute("alertMsg", "글이 정상적으로 등록되었습니다.");
			}
			return "redirect:detail.sp?sno="+ws.getSupportNo();
		}else {
			m.addAttribute("alertMsg", "글이 정상적으로 등록되지 않았습니다.");
			return "redirect:list.sp";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("deleteAttach.sp")
	public int deleteAttach(int supportNo, HttpSession session) {
		
		WorkSupport ws = ss.selectAttach(ss.selectWorkSupport(supportNo));
		
		if(ws != null) {
			new File(session.getServletContext().getRealPath(ws.getAttach().getFilePath()+
					ws.getAttach().getChangeName())).delete();
		}
		
		return ss.deleteAttach(supportNo);
		
	}
	
	@RequestMapping("delete.sp")
	public String deleteSupport(int sno, Model m) {
		
		if(ss.deleteWorkSupport(sno)>0) {
			m.addAttribute("alertMsg", "게시글 삭제가 완료되었습니다.");
		}else {
			m.addAttribute("alertMsg", "게시글 삭제에 실패했습니다.");
		}
		return "redirect:list.sp";
		
	}
	
	
	@RequestMapping("mysupportList.sp")
	public String mySupportList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model m, HttpSession session) {
		
		int mno = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		int listCount = ss.selectmyListCount(mno);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		System.out.println(listCount);
		
		ArrayList<WorkSupport> list = ss.selectListWorkSupport(pi, mno);
		
		System.out.println(list.size());
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		
		return "supportBoard/mySupport";
		
	}
	
	
	
	

}
