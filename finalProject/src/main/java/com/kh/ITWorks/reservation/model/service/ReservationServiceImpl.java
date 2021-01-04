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
		return rd.insertReservation(r, sqlss);
	}

	@Override
	public Reservation selectReservation(int rno) {
		return rd.selectReservation(rno, sqlss);
	}

	@Override
	public int updateReservation(Reservation r) {
		return rd.updateReservation(r, sqlss);
	}

	@Override
	public int selectListCount(int mno) {
		return rd.selectListCount(mno, sqlss);
	}

	@Override
	public ArrayList<Reservation> selectListReservation(PageInfo pi, int mno) {
		return rd.selectListReservation(pi, mno, sqlss);
	}

	@Override
	public int deleteReservation(int reserveNo) {
		return rd.deleteReservation(reserveNo, sqlss);
	}

	@Override
	public ArrayList<Reservation> selectFloorReservation(int floor, String date) {
		return rd.selectFloorReservation(floor, date, sqlss);
	}


	@Override
	public Reservation ajaxCheckReservation(HashMap<String, Object> hs) {
		return rd.ajaxCheckReservation(hs, sqlss);
	}

	@Override
	public ArrayList<Reservation> checkReservation(Reservation r) {
		return rd.checkReservation(r, sqlss);
	}

}
