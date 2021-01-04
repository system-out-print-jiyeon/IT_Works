package com.kh.ITWorks.reservation.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.reservation.model.vo.Reservation;

@Repository
public class ReservationDao {
	
	public ArrayList<Reservation> selectFloorReservation(int floor, String date, SqlSessionTemplate sqlss){
		
		Reservation r = new Reservation();
		r.setFloor(floor);
		r.setStartPeriod(date.replace('-', '/'));
		
		return (ArrayList)sqlss.selectList("reservationMapper.selectFloorReservation", r);
	}
	
	
	public Reservation ajaxCheckReservation(HashMap<String, Object> hs, SqlSessionTemplate sqlss) {
		return sqlss.selectOne("reservationMapper.ajaxCheckReservation", hs);
	}
	
	
	public Reservation selectReservation(int rno, SqlSessionTemplate sqlss) {
		return sqlss.selectOne("reservationMapper.selectReservation", rno);
	}
	
	
	public int insertReservation(Reservation r, SqlSessionTemplate sqlss) {
		return sqlss.insert("reservationMapper.insertReservation", r);
	}
	
	public ArrayList<Reservation> checkReservation(Reservation r, SqlSessionTemplate sqlss) {
		return (ArrayList)sqlss.selectList("reservationMapper.checkReservation", r);
	}
	
	
	public int updateReservation(Reservation r, SqlSessionTemplate sqlss) {
		return sqlss.update("reservationMapper.updateReservation", r);
	}
	
	
	public ArrayList<Reservation> selectListReservation(PageInfo pi, int mno, SqlSessionTemplate sqlss){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlss.selectList("reservationMapper.selectListReservation", mno, rowBounds);
	}
	
	
	public int deleteReservation(int rno, SqlSessionTemplate sqlss) {
		
		return sqlss.delete("reservationMapper.deleteReservation", rno);
	}
	
	
	public int selectListCount(int mno, SqlSessionTemplate sqlss) {
		return sqlss.selectOne("reservationMapper.selectListCount", mno);
	}

}
