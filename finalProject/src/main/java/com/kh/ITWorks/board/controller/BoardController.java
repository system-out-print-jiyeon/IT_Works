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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.ITWorks.board.model.service.BoardService;
import com.kh.ITWorks.board.model.vo.BoardAttachment;
import com.kh.ITWorks.board.model.vo.BoardComment;
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
		ArrayList<FreeBoard> fbList = bService.selectFreeBoardList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("fbList", fbList);
		
		
		return "board/freeBoardListView";
	}
				
	@RequestMapping("enrollForm.fb")
	public String FreeBoardEnrollForm() {
		return "board/freeBoardEnrollForm";		
	}
	

	
	@RequestMapping("insert.fb")
	public String insertFreeBoard(FreeBoard fb, MultipartFile upfile, HttpSession session,
							Model model) {
		
		// 전달된 파일이 있을 경우 => 서버에 업로드 => 원본명, 저장경로 b에 담기
		if( !upfile.getOriginalFilename().equals("")) {
			

			
			String changeName =  saveFile(session, upfile);
			
			
			fb.setOriginName(upfile.getOriginalFilename());
			fb.setChangeName("resources/freeBoardUpfiles/" + changeName); // "resources/uploadFiles/2020120117323045236.png"
			
		}
		
		int result = bService.insertFreeBoard(fb);
		
		
		if(result > 0) { // 성공
			session.setAttribute("alertMsg", "성공적으로 게시글이 작성되었습니다!");
			return "redirect:list.fb";
		}else { // 실패
			model.addAttribute("errorMsg", "게시글 작성 실패!");
			return "common/errorPage";
		}
		
	}
	
	
	
	
	@RequestMapping("detail.fb")
	public String selectFreeBoard(int fbno, Model model) {
		
		int result = bService.increaseCount(fbno);
		
		if(result > 0) { // 유효한 게시글
			
			FreeBoard fb = bService.selectFreeBoard(fbno);
			
			model.addAttribute("fb", fb);
			
			return "board/freeBoardDetailView";
			
		}else { // 유효한 게시글 X
			model.addAttribute("errorMsg", "존재하지 않는 게시글이거나 삭제된 게시글입니다.");
			return "common/errorPage";
		}
		
	}
	
	// 상세페이지에서 삭제
	@RequestMapping("delete.fb")
	public String deleteFreeBoard(int fbno, String fileName, HttpSession session, Model model) {
		
		int result = bService.deleteFreeBoard(fbno);
		
		if(result > 0) { // 기존의 파일 찾아서 삭제 => 게시글 리스트페이지 재요청
			
			if(!fileName.equals("")) { // 기존의 첨부파일이 있었을 경우
				new File(session.getServletContext().getRealPath(fileName)).delete();
			}
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			return "redirect:list.fb";
			
		}else { 
			
			model.addAttribute("errorMsg", "게시글 삭제 실패!");
			return "common/errorPage";
			
		}
	}
	
	
	// 리스트에서 삭제 
		@RequestMapping("deleteToList.fb")
		public String deleteToList(int[] fbno, HttpSession session, Model model) {
			
			int resultCount = 0;
			for(int i=0; i<fbno.length; i++) {
				int result = bService.deleteToList(fbno[i]);
				resultCount++;
			}
			
			if(resultCount > 0) {
				session.setAttribute("alertMsg",  resultCount + "개의 게시글을 성공적으로 삭제하였습니다.");
				return "redirect:list.fb";
			}else {
				model.addAttribute("errorMsg", "게시글을 삭제하지 못하였습니다. 다시 시도해 주세요.");
				return "common/errorPage";
			}
		}
		
	
	

		
		@RequestMapping("updateForm.fb")
		public String updateForm(int fbno, Model model) {
			
			model.addAttribute("fb", bService.selectFreeBoard(fbno));
			return "board/freeBoardUpdateForm";
		}
		
		
		@RequestMapping("update.fb")
		public String updateFreeBoard(FreeBoard fb, MultipartFile reupFile, HttpSession session, Model model) {
			
			if(!reupFile.getOriginalFilename().equals("")) { 
				
				if(fb.getOriginName() != null) {
					new File(session.getServletContext().getRealPath(fb.getChangeName())).delete();
				}
				
				
				String changeName = saveFile(session, reupFile);
				fb.setOriginName(reupFile.getOriginalFilename());
				fb.setChangeName("resources/freeBoardUpFiles/" + changeName);
				
			}
			
			int result = bService.updateFreeBoard(fb);
			
			if(result > 0) { // 게시글 수정 성공 => 상세보기 페이지 재요청 (detail.bo)
				
				session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
				return "redirect:detail.fb?fbno=" + fb.getFBoardNo();
				
			}else { // 게시글 수정 실패 
				model.addAttribute("errorMsg", "게시글 수정 실패");
				return "common/errorPage";
			}
			
			
		}
	
	

		@ResponseBody
		@RequestMapping(value="rlist.fb", produces="application/json; charset=utf-8")
		public String selectReplyList(int fbno) {
			
			ArrayList<BoardComment> list = bService.selectReplyList(fbno);
			// list => JSON => String
			return new Gson().toJson(list);
			
		}
		
		
		@ResponseBody
		@RequestMapping("rinsert.fb")
		public String insertReply(BoardComment bc) {
			
			int result = bService.insertReply(bc);
			
			if(result > 0) {
				return "success";
			}else {
				return "fail";
			}
			
		}
	
	
	
	
	
	
	
	
	
	
	// 첨부파일 업로드 시켜주는 메소드
	public String saveFile(HttpSession session, MultipartFile upfile) {
		
		// 파일을 업로드 시킬 폴더의 물리적인 경로 (savePath)
		String savePath = session.getServletContext().getRealPath("/resources/freeBoardUpfiles/");
		
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
