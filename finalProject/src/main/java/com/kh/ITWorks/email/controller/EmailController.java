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
import org.springframework.web.bind.annotation.ResponseBody;
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
		model.addAttribute("listCount", listCount);
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
		
		model.addAttribute("listCount", listCount);
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
					
					int resultAtt = emService.insertEmailAttach(ea);
					
					
					
				}
			}

			// 받은사람 추가
			ArrayList<EmailRecipient> erList = er.getEmToList();
			
			for(EmailRecipient emTo: erList) {
				emTo.setEmNo(em.getEmNo());
				
				int resultRec = emService.insertEmailRecpient(emTo);	
			}
			
			return "email/emailSuccessPage";
			
			
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
	
	// 보낸메일 상세 페이지 중요메일 등록
	@ResponseBody
	@RequestMapping(value="updateFromInp.em")
	public String updateEmailFromInp(String emFrom, int emNo) {
		Email em = new Email();
		em.setEmFrom(emFrom);
		em.setEmNo(emNo);

		int result = emService.updateEmailFromInp(em);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 보낸메일 상세 페이지 중요메일 취소
	@ResponseBody
	@RequestMapping(value="cancelFromInp.em")
	public String cancelEmailFromInp(String emFrom, int emNo) {
		Email em = new Email();
		em.setEmFrom(emFrom);
		em.setEmNo(emNo);
		
		int result = emService.cancelEmailFromInp(em);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 보낸메일 전달 페이지
	@RequestMapping("fromForward.em")
	public String emailFromForward(String emFrom, int emNo, Model model) {

		
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
				res += " &lt;&nbsp;" + re + "&nbsp;&gt ";
			}
			em.setEmTo(res);
			
			// 첨부파일 리스트 조회
			ArrayList<EmailAttachSelect> listAtt = emService.selectEmailFromListAtt(emNo);
			
			model.addAttribute("em",em);
			model.addAttribute("listAtt",listAtt);
			return "email/emailForwardForm";
		}
		
		
	}
	
	// 보낸메일/받은메일 전달
	@RequestMapping("insertForward.em")
	public String insertEmailForward(Email em, EmailRecipient er, EmailAttach ea, Model model) {
		
		em.setEmTitle("FW: " + em.getEmTitle()); //FW 이메일 전달한다는 뜻 --> 제목앞에 붙여줌
		// 메일 전달
		int result = emService.insertEmailForward(em);
		
		// 메일 전달 성공시
		if(result > 0) {
			
			// 받는사람 추가
			ArrayList<EmailRecipient> erList = er.getEmToList();
			for(EmailRecipient eml : erList) {	
				eml.setEmNo(em.getEmNo());				
				int resultRec = emService.insertEmailRecpient(eml);	
			}
			
			if(ea.getEmAttachList() != null) {
				// 첨부파일 추가
				ArrayList<EmailAttach> eaList = ea.getEmAttachList();
				
				for(EmailAttach eal : eaList) {
					
					if(!eal.getEmOriginName().equals("")) {
						eal.setEmNo(em.getEmNo());
						int resultAtt = emService.insertEmailAttach(eal);					
					}
				}		
			}
			
			return "email/emailSuccessPage";
			
		}else { // 메일 전달 실패시
			model.addAttribute("errorMsg", "이메일을 전달하지 못하였습니다. 다시 시도해 주세요.");
			return "common/errorPage";
		}

	}
	
	@RequestMapping("deleteFrom.em")
	public String deleteEmailFrom(String emFrom, int emNo, Model model) {
		
		Email em = new Email();
		em.setEmFrom(emFrom);
		em.setEmNo(emNo);
		
		int result = emService.deleteEmailFrom(em);
		
		if(result > 0) {
			return "email/emailSuccessPage";
		}else {
			model.addAttribute("errorMsg", "이메일을 삭제하는데 실패하였습니다. 다시 시도해 주세요.");
			return "common/errorpage";
		}
	}
	
	// 받은메일 상세 페이지 
	// 중요메일 등록
	@ResponseBody
	@RequestMapping(value="updateToInp.em")
	public String updateEmailToInp(String emTo, int emRecNo) {

		EmailRecipient er = new EmailRecipient();
		er.setEmTo(emTo);
		er.setEmRecNo(emRecNo);
		
		int result = emService.updateEmailToInp(er);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 중요메일 취소
	@ResponseBody
	@RequestMapping(value="cancelToInp.em")
	public String cancelEmailToInp(String emTo, int emRecNo) {
		
		EmailRecipient er = new EmailRecipient();
		er.setEmTo(emTo);
		er.setEmRecNo(emRecNo);
		
		int result = emService.cancelEmailToInp(er);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}

	}
	
	// 답장 페이지
	@RequestMapping("reply.em")
	public String selectEmailReply(String emTo, int emRecNo, Model model) {
		EmailSelect em = new EmailSelect();
		em.setEmTo(emTo);
		em.setEmRecNo(emRecNo);
		
		em = emService.selectEmailToDetail(em);
		
		if(em == null) {
			model.addAttribute("errorMsg","존재하지 않거나 삭제된 이메일입니다.");
			return "common.errorPage";
		}else {
			
			ArrayList<EmailAttachSelect> listAtt = emService.selectEmailToListAtt(em);
			
			model.addAttribute("listAtt", listAtt);
			model.addAttribute("em", em);
			return "email/emailReplyForm";
		}
		
	}
	
	// 답장 하기
	@RequestMapping("insertReply.em")
	String insertEmailReply(Email em, EmailAttach ea, EmailRecipient er, MultipartHttpServletRequest mtfRequest, HttpSession session, Model model) {
		em.setEmTitle("RE: " + em.getEmTitle());
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
					
					int resultAtt = emService.insertEmailAttach(ea);
				}
			}
			
			er.setEmNo(em.getEmNo());
			int resultRec = emService.insertEmailRecpient(er);	
			
			return "email/emailSuccessPage";
			
		}else {
			model.addAttribute("errorMsg", "이메일을 답장하지 못하였습니다. 다시 시도해 주세요.");
			return "common/errorPage";
		}
	}
	
	// 메일 전달 페이지(메일전달은 받은메일/보낸메일 통합 사용)
	@RequestMapping("toForward.em")
	public String emailToForward(String emTo, int emRecNo, Model model) {


		EmailSelect em = new EmailSelect();
		em.setEmTo(emTo);
		em.setEmRecNo(emRecNo);

		em = emService.selectEmailToDetail(em);
		if(em == null) {
			model.addAttribute("errorMsg","존재하지 않거나 삭제된 이메일입니다.");
			return "common.errorPage";
		}else {
			
			ArrayList<EmailAttachSelect> listAtt = emService.selectEmailToListAtt(em);
			
			model.addAttribute("em", em);
			model.addAttribute("listAtt", listAtt);
			return "email/emailForwardForm";
		}
	}
	
	
	
	// 메일 삭제
	@RequestMapping("deleteTo.em")
	public String deleteEmailTo(String emTo, int emRecNo, Model model) {
		EmailRecipient er = new EmailRecipient();
		er.setEmTo(emTo);
		er.setEmRecNo(emRecNo);
		
		int result = emService.deleteEmailTo(er);
		
		if(result > 0) {
			return "email/emailSuccessPage";
		}else {
			model.addAttribute("errorMsg", "이메일을 삭제하는데 실패하였습니다. 다시 시도해 주세요.");
			return "common/errorpage";
		}
	}
}
