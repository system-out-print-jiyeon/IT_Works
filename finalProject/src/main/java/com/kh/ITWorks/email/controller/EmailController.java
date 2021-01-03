package com.kh.ITWorks.email.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.common.template.Pagination;
import com.kh.ITWorks.email.model.dto.EmailAttachSelect;
import com.kh.ITWorks.email.model.dto.EmailSelect;
import com.kh.ITWorks.email.model.service.EmailService;
import com.kh.ITWorks.email.model.vo.Email;
import com.kh.ITWorks.email.model.vo.EmailAttach;
import com.kh.ITWorks.email.model.vo.EmailRecipient;

@Controller
public class EmailController {
	
	@Autowired
	private EmailService emService;
	
	@RequestMapping("list.em")
	public String selectEmailList() {
		return "email/emailListView";
	}
	
	// 보낸메일 리스트
	@RequestMapping("listFrom.em")
	public String selectEmailFromList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String email, Model model) {
		
		int listCount = emService.selectEmailFromListCount(email);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
		ArrayList<EmailSelect> list = emService.selectEmailFromList(pi, email);
		
		// 이메일이 존재 한다면
		if(!list.isEmpty()) {
			// 이메일 받는사람 메일주소 리스트 가져오기
			for(EmailSelect li : list) {
				
				// 받는사람이메일 주소
				ArrayList<String> listRec = emService.selectEmailFromListRec(li.getEmNo());
				// for문으로 해당 보낸메일 받은사람들 조회해서 문자열로 더해줌
				String recs = "";
				for(String rec : listRec) {
					recs += rec+"<br>";
				}
				// 해당 보낸메일에 더한 문자열을 추가해줌
				li.setEmTo(recs);
				
				// 첨부파일 여부
				int attCount = emService.emailAttCount(li.getEmNo());
				li.setAtt(attCount);
			}	
		}
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "email/emailFromListView";
	}
	
	// 보낸메일 상세
	@RequestMapping("detailFrom.em")
	public String selectEmailFromDetail(String emFrom, int emNo, Model model) {
		
		EmailSelect em = new EmailSelect();
		em.setEmFrom(emFrom);
		em.setEmNo(emNo);
		em = emService.selectEmailFromDetail(em);
		if(em == null) {
			model.addAttribute("errorMsg", "존재하지 않거나 삭제된 이메일입니다.");
			return "common/errorPage";
		}else {
			
			// 받은사람 이메일 조회
			ArrayList<String> listRec = emService.selectEmailFromListRec(emNo);
			String res = "";
			for(String re : listRec) {
				res += re+"<br>";
			}
			em.setEmTo(res);
			
			// 첨부파일 리스트 조회
			ArrayList<EmailAttachSelect> listAtt = emService.selectEmailFromListAtt(emNo);
			
			model.addAttribute("em",em);
			model.addAttribute("listAtt",listAtt);
			return "email/emailFromDetailView";
		}
	}
	
	
	// 받은메일 리스트
	@RequestMapping("listTo.em")
	public String selectEmailToList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String email, Model model) {
		
		int listCount = emService.selectEmailToListCount(email);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
		ArrayList<EmailSelect> list = emService.selectEmailToList(pi, email);
		if(!list.isEmpty()) {
			for(EmailSelect li:list) {
				
				int attCount = emService.emailAttCount(li.getEmNo());
				
				li.setAtt(attCount);
			}
		}
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "email/emailToListView";
	}
	
	// 받은메일 상세
	@RequestMapping("detailTo.em")
	public String selectEmailToDetail(String emTo, int emRecNo, String emRead, Model model) {
		
		EmailSelect em = new EmailSelect();
		em.setEmTo(emTo);
		em.setEmRecNo(emRecNo);
		
		if(emRead.equals("N")) {
			int result = emService.updateEmailRead(em);
			if(!(result > 0)) {
				model.addAttribute("errorMsg","존재하지 않거나 삭제된 이메일입니다.");
				return "common.errorPage";
			}
		}
		
		em = emService.selectEmailToDetail(em);
		if(em == null) {
			model.addAttribute("errorMsg","존재하지 않거나 삭제된 이메일입니다.");
			return "common.errorPage";
		}else {
			
			ArrayList<EmailAttachSelect> listAtt = emService.selectEmailToListAtt(em);
			
			model.addAttribute("em", em);
			model.addAttribute("listAtt", listAtt);
			return "email/emailToDetailView";
		}
		
	}
	
	@RequestMapping("enrollForm.em")
	public String emailEnrollForm() {
		return "email/emailEnrollForm";
	}
	
	// 메일 보내기
	@RequestMapping("insert.em")
	public String insertEmail(Email em, EmailAttach ea, EmailRecipient er ,MultipartHttpServletRequest mtfRequest, HttpSession session, Model model) {
		
		
		int result = emService.insertEmail(em);
		
		if(result > 0) {
			
			// 첨부파일 추가
			List<MultipartFile> fileList = mtfRequest.getFiles("upfile");
			
			for(MultipartFile mf : fileList) {
				if(!mf.getOriginalFilename().equals("")) {
					String changeName = saveFile(session, mf);
					
					ea.setEmOriginName(mf.getOriginalFilename());
					ea.setEmChangeName("resources/emailUploadFiles/" + changeName);
					ea.setEmNo(em.getEmNo()); // insertEmail후 em객체에 담겨있는 emNo
					
					int resultAtt = emService.intertEmailAttach(ea);
					
					
					
				}
			}

			// 받은사람 추가
			ArrayList<EmailRecipient> erList = er.getEmToList();
			
			for(EmailRecipient emTo: erList) {
				emTo.setEmNo(em.getEmNo());
				
				int resultRec = emService.insertEmailRecpient(emTo);	
			}
			
			return null;
			
			
		}else {
			model.addAttribute("errorMsg", "이메일을 보내지 못하였습니다. 다시 시도해 주세요.");
			return "common/errorPage";
		}
		
	}
	
	
	// 첨부파일 업로드/수정명 생성 메소드
	public String saveFile(HttpSession session, MultipartFile upfile) {
		String savePath = session.getServletContext().getRealPath("resources/emailUploadFiles/");
		
		// 원본명
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMDDHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ranNum + ext;
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	
	
	
}
