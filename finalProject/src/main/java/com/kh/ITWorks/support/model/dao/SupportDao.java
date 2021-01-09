package com.kh.ITWorks.support.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.ITWorks.board.model.vo.BoardAttachment;
import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.support.model.vo.WorkSupport;

@Repository
public class SupportDao {
	
	public int insertWorkSupport(WorkSupport ws, SqlSessionTemplate sqlss) {
		return sqlss.insert("supportMapper.insertWorkSupport", ws);
	}
	
	
	public int insertSupportAttach(WorkSupport ws, SqlSessionTemplate sqlss) {
		return sqlss.insert("supportMapper.insertSupportAttach", ws);
	}
	
	
	public int selectListCount(String deptCode, SqlSessionTemplate sqlss) {
		return sqlss.selectOne("supportMapper.selectListCount", deptCode);
	}
	
	
	public ArrayList<WorkSupport> selectListWorkSupport(PageInfo pi, String deptCode, SqlSessionTemplate sqlss){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds bounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlss.selectList("supportMapper.selectListWorkSupport", deptCode, bounds);
	}
	
	
	public WorkSupport selectWorkSupport(int sno, SqlSessionTemplate sqlss) {
		return sqlss.selectOne("supportMapper.selectWorkSupport", sno);
	}
	
	
	public int selectListCountforSearch(HashMap<String, String> hs, SqlSessionTemplate sqlss) {
		return sqlss.selectOne("supportMapper.selectListCountforSearch", hs);
	}
	
	
	public ArrayList<WorkSupport> searchSupportList(PageInfo pi, 
													HashMap<String, String> hs, SqlSessionTemplate sqlss){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlss.selectList("supportMapper.searchSupportList", hs, rowBounds);
	}
	
	
	public int updateWorkSupport(WorkSupport ws, SqlSessionTemplate sqlss) {
		return sqlss.update("supportMapper.updateWorkSupport", ws);
	}
	
	
	public int updateSupportAttach(WorkSupport ws, SqlSessionTemplate sqlss) {
		return sqlss.update("supportMapper.updateSupportAttach", ws);
	}
	
	
	public WorkSupport selectAttach(WorkSupport ws, SqlSessionTemplate sqlss) {
		return sqlss.selectOne("supportMapper.selectAttach", ws);
	}
	
	
	public int deleteAttach(int sno, SqlSessionTemplate sqlss) {
		return sqlss.update("supportMapper.deleteAttach", sno);
	}
	
	
	public int deleteWorkSupport(int sno, SqlSessionTemplate sqlss) {
		return sqlss.update("supportMapper.deleteWorkSupport", sno);
	}
	
	
	public int selectmyListCount(int mno, SqlSessionTemplate sqlss) {
		return sqlss.selectOne("supportMapper.selectmyListCount", mno);
	}
	
	
	public ArrayList<WorkSupport> selectListWorkSupport(PageInfo pi, int mno, SqlSessionTemplate sqlss){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlss.selectList("supportMapper.selectMyList", mno, rowBounds); 
	}

}
