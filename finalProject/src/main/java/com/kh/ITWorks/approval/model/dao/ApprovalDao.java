package com.kh.ITWorks.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ITWorks.approval.model.vo.ApprovalDocument;
import com.kh.ITWorks.approval.model.vo.ApprovalLine;
import com.kh.ITWorks.approval.model.vo.Attachment;
import com.kh.ITWorks.approval.model.vo.DocumentsRequest;
import com.kh.ITWorks.approval.model.vo.Opinion;
import com.kh.ITWorks.approval.model.vo.Outgoings;
import com.kh.ITWorks.approval.model.vo.OutgoingsList;
import com.kh.ITWorks.approval.model.vo.Referer;
import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.member.model.vo.Member;

@Repository
public class ApprovalDao {
	
	// 부서별 사원수 조회
		public int businessCount(SqlSessionTemplate sqlSession) {
			return sqlSession.selectOne("approvalMapper.businessCount");
		} 
		public int personnelCount(SqlSessionTemplate sqlSession) {
			return sqlSession.selectOne("approvalMapper.personnelCount");
		} 
		public int accountingCount(SqlSessionTemplate sqlSession) {
			return sqlSession.selectOne("approvalMapper.accountingCount");
		} 
		public int developerCount(SqlSessionTemplate sqlSession) {
			return sqlSession.selectOne("approvalMapper.developerCount");
		} 
		public int planningCount(SqlSessionTemplate sqlSession) {
			return sqlSession.selectOne("approvalMapper.planningCount");
		} 
		
	// 부서별 사원 조회
		public ArrayList<Member> businessList(SqlSessionTemplate sqlSession, Member m){
			return (ArrayList)sqlSession.selectList("approvalMapper.businessList");
		}
		public ArrayList<Member> personnelList(SqlSessionTemplate sqlSession, Member m){
			return (ArrayList)sqlSession.selectList("approvalMapper.personnelList");
		}
		public ArrayList<Member> accountingList(SqlSessionTemplate sqlSession, Member m){
			return (ArrayList)sqlSession.selectList("approvalMapper.accountingList");
		}
		public ArrayList<Member> developerList(SqlSessionTemplate sqlSession, Member m){
			return (ArrayList)sqlSession.selectList("approvalMapper.developerList");
		}
		public ArrayList<Member> planningList(SqlSessionTemplate sqlSession, Member m){
			return (ArrayList)sqlSession.selectList("approvalMapper.planningList");
		}

	/* 결재문서 insert */
	public int insertApprovalDocument(ApprovalDocument ad, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("approvalMapper.insertApprovalDocument", ad);
	}

	public int insertApprovalAttachment(Attachment a, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("approvalMapper.insertApprovalAttachment", a);
	}

	public int insertApprovalLine(ArrayList<ApprovalLine> apLineList, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("approvalMapper.insertApprovalLine", apLineList);
	}

	public int insertApprovalRefere(ArrayList<Referer> refererList, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("approvalMapper.insertApprovalReferer", refererList);
	}

	/* 결재문서 상세 select */
	public ApprovalDocument selectApprovalDocument(SqlSessionTemplate sqlSession, int docNo) {
		return sqlSession.selectOne("approvalMapper.selectApprovalDocument", docNo);
	}
	public ArrayList<ApprovalLine> selectApprovalLine(SqlSessionTemplate sqlSession, int docNo) {
		return (ArrayList) sqlSession.selectList("approvalMapper.selectApprovalLine", docNo);
	}
	public ArrayList<Referer> selectReferer(SqlSessionTemplate sqlSession, int docNo) {
		return (ArrayList) sqlSession.selectList("approvalMapper.selectReferer", docNo);
	}
	public ArrayList<Attachment> selectAttachment(SqlSessionTemplate sqlSession, int docNo) {
		return (ArrayList) sqlSession.selectList("approvalMapper.selectAttachment", docNo);
	}
	public ArrayList<Opinion> selectOpinion(SqlSessionTemplate sqlSession, int docNo) {
		return (ArrayList) sqlSession.selectList("approvalMapper.selectOpinion", docNo);
	}
	public int insertOpinion(SqlSessionTemplate sqlSession, Opinion o) {
		return sqlSession.insert("approvalMapper.insertOpinion", o);
	}
	public int approvalDecision(SqlSessionTemplate sqlSession, ApprovalLine al) {
		return sqlSession.update("approvalMapper.approvalDecision", al);
	}
	
	public int selectListCount(SqlSessionTemplate sqlSession, ApprovalDocument ad) {
		return sqlSession.selectOne("approvalMapper.selectListCount", ad);
	}
	public ArrayList<ApprovalDocument> selectApprovalList(SqlSessionTemplate sqlSession, PageInfo pi, ApprovalDocument ad) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList) sqlSession.selectList("approvalMapper.selectApprovalList", ad, rowBounds);
	}
	public int selectLineListCount(SqlSessionTemplate sqlSession, ApprovalDocument ad) {
		return sqlSession.selectOne("approvalMapper.selectLineListCount", ad);
	}
	public ArrayList<ApprovalDocument> selectApprovalLineList(SqlSessionTemplate sqlSession, PageInfo pi,
			ApprovalDocument ad) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList) sqlSession.selectList("approvalMapper.selectApprovalLineList", ad, rowBounds);
	}
	public int selectRefererListCount(SqlSessionTemplate sqlSession, ApprovalDocument ad) {
		return sqlSession.selectOne("approvalMapper.selectRefererListCount", ad);
	}
	public ArrayList<ApprovalDocument> selectRefererList(SqlSessionTemplate sqlSession, PageInfo pi,
			ApprovalDocument ad) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList) sqlSession.selectList("approvalMapper.selectRefererList", ad, rowBounds);
	}

}
