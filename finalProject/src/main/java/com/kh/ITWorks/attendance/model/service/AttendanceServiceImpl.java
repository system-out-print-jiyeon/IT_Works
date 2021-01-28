package com.kh.ITWorks.attendance.model.service;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ITWorks.attendance.model.dao.AttendanceDao;
import com.kh.ITWorks.attendance.model.dao.PasswordEmailDao;
import com.kh.ITWorks.attendance.model.vo.AnnualLeave;
import com.kh.ITWorks.attendance.model.vo.BusinessTrip;
import com.kh.ITWorks.attendance.model.vo.WorkDay;
import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.member.model.vo.Member;


@Service
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AttendanceDao aDao;
	
	@Autowired
	private PasswordEmailDao pDao;


	@Override
	public Member loginMember(Member m) {
		return aDao.loginMember(sqlSession, m);
	}


	@Override
	public Member searchId(Member m) {
		return aDao.searchId(sqlSession, m);
	}


	@Override
	public Member searchPwd(Member m) {
		return aDao.searchPwd(sqlSession, m);
	}


	@Override
	public int updateMember(Member m) {
		return aDao.updateMember(sqlSession, m);
	}

	

	//비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(Member m, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "wldus4592@gmail.com";
		String hostSMTPpwd = "Leedo599100!";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "wldus4592@gmail.com";
		String fromName = "ITWorks";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "ITWorks 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += m.getMemId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += m.getMemPwd() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = m.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); 

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	//비밀번호찾기
	@Override
	public void findPw(HttpServletResponse response, Member m) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		Member ck = pDao.readMember(m.getMemId());
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(pDao.idCheck(m.getMemId()) == null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if(!m.getEmail().equals(ck.getEmail())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			m.setMemPwd(pw);
			// 비밀번호 변경
			pDao.updatePw(m);
			// 비밀번호 변경 메일 발송
			sendEmail(m, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}

	
	
	
	
	
	
	
	
	

	@Override
	public int selectListCount() {
		return aDao.selectListCount(sqlSession);
	}


	@Override
	public ArrayList<BusinessTrip> selectBusinessTripList(PageInfo pi) {
		return aDao.selectBusinessTripList(sqlSession, pi);
	}
	
	@Override
	public int insertBusiness(BusinessTrip bt) {
		return aDao.insertBusiness(sqlSession, bt);
	}


	@Override
	public int increaseCount(int btno) {
		return aDao.increaseCount(sqlSession, btno);
	}


	@Override
	public BusinessTrip selectBusinessTrip(int btno) {
		return aDao.selectBusinessTrip(sqlSession, btno);
	}


	@Override
	public int returnBusinessTrip(Map<String, Object> approval) {
		return aDao.returnBusinessTrip(sqlSession, approval);
	}


	@Override
	public int approvalBusinessTrip(Map<String, Object> approval) {
		return aDao.approvalBusinessTrip(sqlSession, approval);
	}


	
	
	
	
	
	
	
	
	
	
	@Override
	public int selectListCountAL() {
		return aDao.selectListCountAL(sqlSession);
	}


	@Override
	public ArrayList<AnnualLeave> selectAnnualLeaveList(PageInfo pi) {
		return aDao.selectAnnualLeaveList(sqlSession, pi);
	}


	@Override
	public int insertAnnualLeave(AnnualLeave an) {
		return aDao.insertAnnualLeave(sqlSession, an);
	}


	@Override
	public int increaseCountAL(int anno) {
		return  aDao.increaseCountAL(sqlSession, anno);
	}


	@Override
	public AnnualLeave selectAnnualLeave(int anno) {
		return aDao.selectAnnualLeave(sqlSession, anno);
	}


	@Override
	public int returnAnnualLeave(Map<String, Object> approval) {
		return aDao.returnAnnualLeave(sqlSession, approval);
	}


	@Override
	public int approvalAnnualLeave(Map<String, Object> approval) {
		return aDao.approvalAnnualLeave(sqlSession, approval);
	}


	@Override
	public int subtractAnnualLeave(int prno) {
		return aDao.subtractAnnualLeave(sqlSession, prno);
	}


	@Override
	public int checkOnWork(WorkDay wd) {
		return aDao.checkOnWork(sqlSession, wd);
	}


	@Override
	public int updateOnWork(Map<String, Object> updatewd) {
		return aDao.updateOnWork(sqlSession, updatewd);
	}


	@Override
	public int checkLeaveWork(WorkDay wd) {
		return aDao.checkLeaveWork(sqlSession, wd);
	}


	@Override
	public int updateLeaveWork(Map<String, Object> updatewd) {
		return aDao.updateLeaveWork(sqlSession, updatewd);
	}


	@Override
	public int selectListCountWD(int memNo) {
		return  aDao.selectListCountWD(sqlSession, memNo);
	}


	@Override
	public ArrayList<WorkDay> selectWorkDayList(PageInfo pi, int memNo) {
		return  aDao.selectWorkDayList(sqlSession, pi, memNo);
	}






}
