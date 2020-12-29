package com.kh.ITWorks.reservation.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ITWorks.reservation.model.vo.Reservation;

@Repository
public class ReservationDao {
	
	public ArrayList<Reservation> selectFloorReservation(int floor, SqlSessionTemplate sqlss){
		return (ArrayList)sqlss.selectList("reservationMapper.selectFloorReservation", floor);
	}
	
	
	public Reservation ajaxCheckReservation(HashMap<String, Object> hs, SqlSessionTemplate sqlss) {
		return sqlss.selectOne("reservationMapper.ajaxCheckReservation", hs);
	}
	
	
	public Reservation selectReservation(int rno, SqlSessionTemplate sqlss) {
		return sqlss.selectOne("reservationMapper.selectReservation", rno);
	}
	

}
