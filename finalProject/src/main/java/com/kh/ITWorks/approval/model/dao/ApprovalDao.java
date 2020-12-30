package com.kh.ITWorks.approval.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ITWorks.approval.model.vo.ApprovalDocument;
import com.kh.ITWorks.approval.model.vo.ApprovalLine;
import com.kh.ITWorks.approval.model.vo.Attachment;
import com.kh.ITWorks.approval.model.vo.DocumentsRequest;
import com.kh.ITWorks.approval.model.vo.Outgoings;
import com.kh.ITWorks.approval.model.vo.OutgoingsList;
import com.kh.ITWorks.approval.model.vo.Referer;
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


	public int insertApprovalDocument(ApprovalDocument ad, SqlSessionTemplate sqlSession) {
		return 0;
	}

	public int insertApprovalAttachment(Attachment a, SqlSessionTemplate sqlSession) {
		return 0;
	}

	public int insertApprovalLine(ApprovalLine al, SqlSessionTemplate sqlSession) {
		return 0;
	}

	public int insertApprovalRefere(Referer r, SqlSessionTemplate sqlSession) {
		return 0;
	}

	public int insertOutgoings(Outgoings o, SqlSessionTemplate sqlSession) {
		return 0;
	}

	public int insertOutgoingsList(ArrayList<OutgoingsList> oList, SqlSessionTemplate sqlSession) {
		return 0;
	}

	public int insertDocumentsRequest(ArrayList<DocumentsRequest> drList, SqlSessionTemplate sqlSession) {
		return 0;
	}

}
