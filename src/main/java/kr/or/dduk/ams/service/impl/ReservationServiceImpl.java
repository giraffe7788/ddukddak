package kr.or.dduk.ams.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dduk.ams.service.ReservationService;
import kr.or.dduk.mapper.CalendarMapper;
import kr.or.dduk.mapper.ReservationMapper;
import kr.or.dduk.vo.ReservationVO;

@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	ReservationMapper reservationMapper;
	
	@Autowired
	CalendarMapper calendarMapper;

	/**
	 * 오늘 예약 환자 가저오기
	 */
	@Override
	public List<ReservationVO> getTodayReservation() {
		return reservationMapper.getTodayReservation();
	}

	@Override
	public List<ReservationVO> getReservationUntilToday() {
		return reservationMapper.getReservationUntilToday();
	}

	@Override
	public int createReservation(ReservationVO reservationVO) {
		
		int result = this.reservationMapper.createReservation(reservationVO);
		
		return result;
	}
	
	@Override
	public List<ReservationVO> getReservationList(ReservationVO reservationVO) {
		return this.reservationMapper.getReservationList(reservationVO);
	}

	@Override
	public List<ReservationVO> getReservationListByMonth(Map<String, Object> map) {
		return this.reservationMapper.getReservationListByMonth(map);
	}

	@Override
	public List<ReservationVO> getAllReservation() {
		return this.reservationMapper.getAllReservation();
	}
	
}
