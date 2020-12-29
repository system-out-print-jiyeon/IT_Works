package com.kh.ITWorks.reservation.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.ITWorks.common.model.vo.PageInfo;
import com.kh.ITWorks.reservation.model.vo.Reservation;

public interface ReservationService {
	
//	1. 예약신청
	int insertReservation(Reservation r);
//	2. 예약조회 (1건)
	Reservation selectReservation(int reserveNo);
//	3. 예약변경
	int updateReservation(Reservation r);
//	4. 나의 예약현황 조회 (여러건)
	int selectListCount();
	ArrayList<Reservation> selectListReservation(PageInfo pi);
//	5. 예약삭제
	int deleteReservation(int reserveNo);
//	6. 층별 예약조회
	ArrayList<Reservation> selectFloorReservation(int floor);
	
//	7. 예약여부확인 (에이작스)
	Reservation ajaxCheckReservation(HashMap<String, Object> hs);

}
