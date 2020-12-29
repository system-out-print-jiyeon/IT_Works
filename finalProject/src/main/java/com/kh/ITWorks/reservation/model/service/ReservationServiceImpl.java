package com.kh.ITWorks.reservation.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.reservation.model.dao.ReservationDao;
import com.kh.ITWorks.reservation.model.vo.Reservation;


@Service
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	private ReservationDao rd;
	@Autowired
	private SqlSessionTemplate sqlss;

	@Override
	public int insertReservation(Reservation r) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Reservation selectReservation(int rno) {
		// TODO Auto-generated method stub
		return rd.selectReservation(rno, sqlss);
	}

	@Override
	public int updateReservation(Reservation r) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Reservation> selectListReservation(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteReservation(int reserveNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Reservation> selectFloorReservation(int floor) {
		return rd.selectFloorReservation(floor, sqlss);
	}


	@Override
	public Reservation ajaxCheckReservation(HashMap<String, Object> hs) {
		return rd.ajaxCheckReservation(hs, sqlss);
	}

}
