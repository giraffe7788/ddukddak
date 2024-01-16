package kr.or.dduk.mapper;

import java.util.List;
import java.util.Map;

import kr.or.dduk.vo.ReservationVO;

public interface ReservationMapper {

	public List<ReservationVO> getTodayReservation();

	public List<ReservationVO> getReservationUntilToday();

	public int createReservation(ReservationVO reservationVO);

	public List<ReservationVO> getReservationList(ReservationVO reservationVO);

	public List<ReservationVO> getReservationListByMonth(Map<String, Object> map);

	public List<ReservationVO> getAllReservation();
}
