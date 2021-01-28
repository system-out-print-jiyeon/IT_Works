package com.kh.ITWorks.attendance.model.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ITWorks.member.model.vo.Member;

@Repository
public class PasswordEmailDaoImpl implements PasswordEmailDao {

	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public Member readMember(String memId) throws Exception {
		//테스트(컨트롤러) 호출 -> 정보를 저장 -> DB로이동
		Member m = sqlSession.selectOne("attendanceMapper.readMember", memId); //괄호안의 물음표를 콤마뒤에 쓰는거임
		return m;
	}
	
	//비밀번호변경
	@Override
	public int updatePw(Member m) throws Exception {
		return sqlSession.update("attendanceMapper.updatePw", m);
	}

	@Override
	public Object idCheck(String memId) {
		return sqlSession.selectOne("attendanceMapper.idCheck", memId);
	}
	
}
