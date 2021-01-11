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
	

	
	// 이메일 전체 리스트
	@RequestMapping("list.em")
	public String selectEmailList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String email, Model model) {
		
		
		int listCount = emService.selectEmailListCount(email);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 20); // pageLimit = 5 / boardLimit = 20
		ArrayList<EmailSelect> list = emService.selectEmailList(pi, email);
		
		// 조회된 이메일이 있다면
		if(!list.isEmpty()) {
			
			// for문을 통해 하나씩 조회
			for(EmailSelect li : list) {
				
				// 만약에 보낸메일이라면 --> 따로 받은사람 메일 조회해야됨
				if(li.getEmCheck().equals("emailFrom")) {
					
					// 조회
					ArrayList<String> listRec = emService.selectEmailFromListRec(li.getEmNo());
					
					// 조회한 받은메일들을 담을 변수
					String recs = "";
					for(String rec : listRec) {
						recs += rec+"<br>";
					}
					
					// 받은메일을 set해줌
					li.setEmTo(recs);
				}
				
				int attCount = emService.emailAttCount(li.getEmNo());
				li.setAtt(attCount);
			}
		}
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "email/emailListView";
	}
	
	// 이메일 검색
	@RequestMapping("emailSearch.em")
	public String selectEmailListSearch(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String email, String condition, String keyword, String range, String imp, Model model) {

		int listAllCount = emService.selectEmailListCount(email);
		model.addAttribute("listAllCount", listAllCount);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("range", range);
		model.addAttribute("imp", imp);
		
		// 전체 메일검색
		if(range.equals("all")) {

			int listCount = emService.selectEmailListSearchCount(email, condition, keyword, imp);
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
			
			ArrayList<EmailSelect> list = emService.selectEmailListSearch(pi, email,condition, keyword, imp);
			
			if(!list.isEmpty()) {
				
				for(EmailSelect li : list) {

					if(li.getEmCheck().equals("emailFrom")) {
						
						ArrayList<String> listRec = emService.selectEmailFromListRec(li.getEmNo());

						String recs = "";
						for(String rec : listRec) { 
							recs += rec+"<br>"; 
						}
						li.setEmTo(recs); 
					} 
					
					int attCount = emService.emailAttCount(li.getEmNo());
					li.setAtt(attCount);
				}
			}
			
			model.addAttribute("listCount", listCount); 
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
 
			return "email/emailSearchListView";
			
		// 보낸이메일 검색
		}else if(range.equals("from")) {
			
			int listCount = emService.selectEmailFromListSearchCount(email, condition, keyword, imp);
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
			
			ArrayList<EmailSelect> list =  emService.selectEmailFromListSearch(pi, email, condition, keyword, imp);

			if(!list.isEmpty()) {

				for(EmailSelect li : list) {
					
					ArrayList<String> listRec = emService.selectEmailFromListRec(li.getEmNo());

					String recs = "";
					for(String rec : listRec) {
						recs += rec+"<br>";
					}

					li.setEmTo(recs);
					
					int attCount = emService.emailAttCount(li.getEmNo());
					li.setAtt(attCount);
				}	
			}
			model.addAttribute("listCount", listCount);
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			
			return "email/emailSearchListView";
		
			// 받은이메일 검색
		}else {
			
			int listCount = emService.selectEmailToListSearchCount(email, condition, keyword, imp);
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
			
			ArrayList<EmailSelect> list = emService.selectEmailToListSearch(pi, email, condition, keyword, imp);
			
			// 첨부파일 여부 조회
			if(!list.isEmpty()) {
				for(EmailSelect li:list) {
					
					int attCount = emService.emailAttCount(li.getEmNo());
					
					li.setAtt(attCount);
				}
			}
			
			model.addAttribute("listCount", listCount);
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			return "email/emailSearchListView";
		}
		
	}
	

	
	// 전체리스트 페이지 삭제 버튼
	@RequestMapping("deleteList.em")
	public String deleteEmailList(int[] emNo, int[] emRecNo, Model model) {
		
		// 몇번 수행했는지 확인
		int fromResultCount = 0; // 보낸메일
		int toResultCount = 0; // 받은메일
		
		// 보낸메일 체크 했을 경우
		if(emNo != null) {
			for(int i=0; i<emNo.length; i++) {
				int result = emService.deleteEmailFromList(emNo[i]);
				fromResultCount++;
			}
		}
		
		// 받은메일 체크 했을 경우
		if(emRecNo != null) {
			for(int i=0; i<emRecNo.length; i++) {
				int result = emService.deleteEmailToList(emRecNo[i]);
				toResultCount++;
			}
		}

		if(fromResultCount > 0 || toResultCount > 0) {
			model.addAttribute("delete",  fromResultCount + "개의 보낸 이메일과 " + toResultCount + "개의 받은 이메일을 성공적으로 삭제하였습니다.");
			return "email/emailResultPage";
		}else {
			model.addAttribute("fail", "이메일을 삭제하지 못하였습니다. 다시 시도해 주세요.");
			return "email/emailResultPage";
		}

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
	// 보낸메일 리스트 삭제 버튼
	@RequestMapping("deleteFromList.em")
	public String deleteEmailFromList(int[] emNo, Model model) {
		
		int resultCount = 0;
		for(int i=0; i<emNo.length; i++) {
			int result = emService.deleteEmailFromList(emNo[i]);
			resultCount++;	
		}
		
		if(resultCount > 0) {
			model.addAttribute("delete",  resultCount + "개의 보낸 이메일을 성공적으로 삭제하였습니다.");
			return "email/emailResultPage";
		}else {
			model.addAttribute("fail", "보낸 이메일을 삭제하지 못하였습니다. 다시 시도해 주세요.");
			return "email/emailResultPage";
		}
	}
	
	// 보낸메일 상세
	@RequestMapping("detailFrom.em")
	public String selectEmailFromDetail(String emFrom, int emNo, Model model) {
		
		EmailSelect em = new EmailSelect();
		em.setEmFrom(emFrom);
		em.setEmNo(emNo);
		em = emService.selectEmailFromDetail(em);
		if(em == null) {
			model.addAttribute("fail", "존재하지 않거나 삭제된 이메일입니다.");
			return "email/emailResultPage";
		}else {
			
			// 받은사람 이메일 조회
			ArrayList<EmailSelect> listRec = emService.selectEmailFromListRecDetail(emNo);
			String res = "";
			for(EmailSelect re : listRec) {
				
				if(re.getEmRead().equals("Y")) { // 읽은 메일
					res += re.getEmTo() + "&nbsp;&nbsp;<small style='font-size:8px; color:#3498db'>읽음</small><br>";
				}else { // 안읽은 메일
					res += re.getEmTo() + "&nbsp;&nbsp;<small style='font-size:8px; color:#e74c3c;'>읽지않음</small><br>";
				}
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
		
		// 첨부파일 여부 조회
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
	
	// 받은메일 리스트 삭제 버튼
	@RequestMapping("deleteToList.em")
	public String deleteEmailToList(int[] emRecNo, Model model) {
		
		int resultCount = 0;
		for(int i=0; i<emRecNo.length; i++) {
			int result = emService.deleteEmailToList(emRecNo[i]);
			resultCount++;
		}
		
		if(resultCount > 0) {
			model.addAttribute("delete",  resultCount + "개의 받은 이메일을 성공적으로 삭제하였습니다.");
			return "email/emailResultPage";
		}else {
			model.addAttribute("fail", "받은 이메일을 삭제하지 못하였습니다. 다시 시도해 주세요.");
			return "email/emailResultPage";
		}
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
				model.addAttribute("fail","존재하지 않거나 삭제된 이메일입니다.");
				return "email/emailResultPage";
			}
		}
		
		em = emService.selectEmailToDetail(em);
		if(em == null) {
			model.addAttribute("fail","존재하지 않거나 삭제된 이메일입니다.");
			return "email/emailResultPage";
		}else {
			
			ArrayList<EmailAttachSelect> listAtt = emService.selectEmailToListAtt(em);
			
			model.addAttribute("em", em);
			model.addAttribute("listAtt", listAtt);
			return "email/emailToDetailView";
		}
		
	}
	
	// 메일 보내기 화면
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
			model.addAttribute("send","이메일을 성공적으로 전송하였습니다.");
			return "email/emailResultPage";
		}else {
			model.addAttribute("fail", "이메일을 전송하지 못하였습니다. 다시 시도해 주세요.");
			return "email/emailResultPage";
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
			model.addAttribute("fail", "존재하지 않거나 삭제된 이메일입니다.");
			return "email/emailResultPage";
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
			
			model.addAttribute("send","전달 이메일을 성공적으로 전송하였습니다.");
			return "email/emailResultPage";
			
		}else { // 메일 전달 실패시
			model.addAttribute("fail", "전달 이메일을 전송하지 못하였습니다. 다시 시도해 주세요.");
			return "email/emailResultPage";
		}

	}
	
	@RequestMapping("deleteFrom.em")
	public String deleteEmailFrom(String emFrom, int emNo, Model model) {
		
		Email em = new Email();
		em.setEmFrom(emFrom);
		em.setEmNo(emNo);
		
		int result = emService.deleteEmailFrom(em);
		
		if(result > 0) {
			model.addAttribute("delete", "보낸 이메일을 성공적으로 삭제하였습니다.");
			return "email/emailResultPage";
		}else {
			model.addAttribute("fail", "보낸 이메일을 삭제하지 못하였습니다. 다시 시도해 주세요.");
			return "email/emailResultPage";
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
			model.addAttribute("fail","존재하지 않거나 삭제된 이메일입니다.");
			return "email/emailResultPage";
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
			
			model.addAttribute("send","답장 이메일을 성공적으로 전송하였습니다.");
			return "email/emailResultPage";
			
		}else {
			model.addAttribute("fail", "답장 이메일을 전송하지 못하였습니다. 다시 시도해 주세요.");
			return "email/emailResultPage";
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
			model.addAttribute("fail","존재하지 않거나 삭제된 이메일입니다.");
			return "email/emailResultPage";
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
			model.addAttribute("delete", "받은 이메일을 성공적으로 삭제하였습니다.");
			return "email/emailResultPage";
		}else {
			model.addAttribute("fail", "받은 이메일을 삭제하지 못하였습니다. 다시 시도해 주세요.");
			return "email/emailResultPage";
		}
	}
	

	@RequestMapping("listInp.em")
	public String selectEmailInpList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String email, Model model ) {
		
		int listCount = emService.selectEmailInpListCount(email);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
		ArrayList<EmailSelect> list = emService.selectEmailInpList(pi, email);
		
		if(!list.isEmpty()) {
			
			for(EmailSelect li : list) {
				if(li.getEmCheck().equals("emailFrom")) {
					ArrayList<String> listRec = emService.selectEmailFromListRec(li.getEmNo());
					
					String recs = "";
					for(String rec : listRec) {
						recs += rec+"<br>";
					}
					li.setEmTo(recs);
				}	
				int attCount = emService.emailAttCount(li.getEmNo());
				li.setAtt(attCount);	
			}
		}
		model.addAttribute("listCount", listCount);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "email/emailInpListView";
	}
	
	// 휴지통 페이지
	@RequestMapping("listDelete.em")
	public String selectEmailDeleteList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String email, Model model) {
		
		int listCount = emService.selectEmailDeleteListCount(email);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
		ArrayList<EmailSelect> list = emService.selectEmailDeleteList(pi, email);
		
		if(!list.isEmpty()) {
			
			for(EmailSelect li : list) {
				
				if(li.getEmCheck().equals("emailFrom")) {
					ArrayList<String> listRec = emService.selectEmailFromListRec(li.getEmNo());
					
					String recs = "";
					for(String rec : listRec) {
						recs += rec+"<br>";
					}
					li.setEmTo(recs);
				}
				int attCount = emService.emailAttCount(li.getEmNo());
				li.setAtt(attCount);	
			}
		}
		model.addAttribute("listCount", listCount);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "email/emailDeleteListView";
	}
	// 휴지통 페이지 복원 버튼
	@RequestMapping("restoreList.em")
	public String restoreEmailList(int[] emNo, int[] emRecNo, Model model) {
		
		// 몇번 수행했는지 확인
		int fromResultCount = 0; // 보낸메일
		int toResultCount = 0; // 받은메일
		
		// 보낸메일 체크 했을 경우
		if(emNo != null) {
			for(int i=0; i<emNo.length; i++) {
				int result = emService.restoreEmailFromList(emNo[i]);
				fromResultCount++;
			}
		}
		
		// 받은메일 체크 했을 경우 else if로 하면 안됨 -> 또다른 if문임
		if(emRecNo != null) {
			for(int i=0; i<emRecNo.length; i++) {
				int result = emService.restoreEmailToList(emRecNo[i]);
				toResultCount++;
			}
		}

		if(fromResultCount > 0 || toResultCount > 0) {
			model.addAttribute("restore",  fromResultCount + "개의 보낸 이메일과 " + toResultCount + "개의 받은 이메일을 성공적으로 복원하였습니다.");
			return "email/emailResultPage";
		}else {
			model.addAttribute("fail", "이메일을 복원하지 못하였습니다. 다시 시도해 주세요.");
			return "email/emailResultPage";
		}
	}
	
	// 휴지통 삭제 버튼
	@RequestMapping("removeList.em")
	public String removeEmailList(int[] emNo, int[] emRecNo, Model model) {
		
		// 몇번 수행했는지 확인
		int fromResultCount = 0;
		int toResultCount = 0;
		
		// 보낸메일 체크 했을 경우
		if(emNo != null) {
			for(int i=0; i<emNo.length; i++) {
				int result = emService.removeEmailFromList(emNo[i]);
				fromResultCount++;
			}
		}
		
		// 받은메일 체크 했을 경우 else if로 하면 안됨 -> 또다른 if문임
		if(emRecNo != null) {
			for(int i=0; i<emRecNo.length; i++) {
				int result = emService.removeEmailToList(emRecNo[i]);
				toResultCount++;
			}
		}
		
		
		if(fromResultCount > 0 || toResultCount>0) {
			model.addAttribute("delete",  fromResultCount + "개의 보낸 이메일과 " + toResultCount + "개의 받은 이메일을 완전히 삭제하였습니다.");
			return "email/emailResultPage";
		}else {
			model.addAttribute("fail", "이메일을 영구삭제하지 못하였습니다. 다시 시도해 주세요.");
			return "email/emailResultPage";
		}
		
		
		
	}

	
}
