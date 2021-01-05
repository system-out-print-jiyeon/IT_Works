package com.kh.ITWorks.support.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.ITWorks.board.model.vo.BoardAttachment;
import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.common.template.Pagination;
import com.kh.ITWorks.member.model.vo.Member;
import com.kh.ITWorks.support.model.service.SupportService;
import com.kh.ITWorks.support.model.vo.WorkSupport;

@Controller
public class SupportController {
	
	@Autowired
	private SupportService ss;
	
	
	@RequestMapping("list.sp")
	public String supportListView(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model m) {
		
		int listCount = ss.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<WorkSupport> list = ss.selectListWorkSupport(pi);
		
		m.addAttribute("pi", pi);
		m.addAttribute("list", list);
		
		return "supportBoard/supportListView";
		
	}
	
	
	@RequestMapping("insertForm.sp")
	public String supportinsertForm() {
		
		return "supportBoard/supportInsertForm";
		
	}
	
	
	@RequestMapping("insert.sp")
	public String insertSupport(WorkSupport ws, BoardAttachment ba ,MultipartFile upfile, Model m, HttpSession session) {
		
		ws.setMem((Member)session.getAttribute("loginUser"));
		
		if(ss.insertWorkSupport(ws)>0) {
			// 첨부파일이 있는경우
			if(!upfile.getOriginalFilename().equals("")) {
				insertAttach(ws, upfile, session, m);
			}else {
				session.setAttribute("alertMsg", "글이 정상적으로 등록되었습니다.");
			}
			return "redirect:list.sp";
		}else {
			m.addAttribute("errorMsg", "글이 정상적으로 등록되지 않았습니다.");
			return "common/errorPage";
		}
	}
	
	public String insertAttach(WorkSupport ws, MultipartFile upfile, HttpSession session, Model m) {
		
		ws.setAttach(new BoardAttachment());
		ws.getAttach().setOriginName(upfile.getOriginalFilename());
		ws.getAttach().setChangeName(savefile(session, upfile));
		ws.getAttach().setFilePath("resources/upfiles/");
		
		if(ss.insertSupportAttach(ws)>0) {
			session.setAttribute("alertMsg", "글이 정상적으로 등록되었습니다.");
			return "redirect:list.sp";
		}else {
			m.addAttribute("errorMsg", "글이 정상적으로 등록되지 않았습니다.");
			return "common/errorPage";
		}
		
	}
	
	
	public String savefile(HttpSession session, MultipartFile upfile) {
		
		String savepath = session.getServletContext().getRealPath("/resources/upfiles/");
		
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int random = (int)Math.random() * 90000 + 10000;
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
	
	

}
