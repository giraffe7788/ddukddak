package kr.or.dduk.mapper;

import java.util.List;

import kr.or.dduk.vo.AdmissionChartVO;
import kr.or.dduk.vo.ClinicChartVO;

public interface RoundsMapper {

	public List<AdmissionChartVO> simpleAdmissionChartList(String paNo);
	
	public AdmissionChartVO simpleRoundsChartList(String admiNo);
	
	public AdmissionChartVO currentSimpleAdmissionChartList(String admiNo);
	
	public int createRoundsChart(ClinicChartVO clinicChartVO);

	public int updateRoundsChart(ClinicChartVO clinicChartVO);
}
