package com.kh.ITWorks.board.controller;

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

import com.kh.ITWorks.board.model.service.BoardService;
import com.kh.ITWorks.board.model.vo.BoardAttachment;
import com.kh.ITWorks.board.model.vo.FreeBoard;
import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.common.template.Pagination;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;
	

	// 자유게시판 전체 리스트
	@RequestMapping("list.fb")
	public String selectFreeBoardList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, 
									Model model) {
		
		int listCount = bService.selectFreeBoardListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<FreeBoard> list = bService.selectFreeBoardList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "board/freeBoardListView";
	}
				
	@RequestMapping("enrollForm.fb")
	public String FreeBoardEnrollForm() {
		return "board/freeBoardEnrollForm";		
	}
	
	@RequestMapping("insert.fb")
	public String insertFreeBoard(FreeBoard fb, BoardAttachment ba, MultipartFile mfile, HttpSession session, Model model) {
		
		if(!mfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(session, mfile);
			
			ba.setOriginName(mfile.getOriginalFilename());
			ba.setChangeName("resources/BoardUploadFiles/" + changeName);
			
		}
		int result = bService.insertFreeBoard(fb);
		
		if(result > 0){
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			return "redirect:list.fb";
			
		}else {
			model.addAttribute("errorMsg", "게시글 등록에 실패했습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("detail.fb")
	public String selectFreeBoard(int fbno, Model model) {
		
		model.addAttribute(bService);
		
		return "board/freeBoardDetailView";
	}
	
	
	@RequestMapping("deletelist.fb")
	public String deleteFreeBoardList(int fbno, String name, HttpSession session, Model model) {
		
		int result = bService.deleteFreeBoard(fbno);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 리스트가 삭제되었습니다.");
			return "redirect:list.fb";
		}else {
			
			model.addAttribute("errorMsg", "리스트 삭제 실패");
			return "common/errorPage";
		}
		
		
	}
	
	// 첨부파일 업로드 시켜주는 메소드
	public String saveFile(HttpSession session, MultipartFile upfile) {
		
		// 파일을 업로드 시킬 폴더의 물리적인 경로 (savePath)
		String savePath = session.getServletContext().getRealPath("/resources/boardUploadFiles/");
		
		// 어떤 이름으로 업로드 시킬껀지의 수정명 (changeName)
		String originName = upfile.getOriginalFilename(); // flower.png
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext; // 2020120217323045236.png
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}
}
