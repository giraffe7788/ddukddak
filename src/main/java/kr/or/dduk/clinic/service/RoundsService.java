package kr.or.dduk.clinic.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestBody;

import kr.or.dduk.vo.AdmissionChartVO;
import kr.or.dduk.vo.ClinicChartVO;
import kr.or.dduk.vo.PatientVO;

public interface RoundsService {

	public List<AdmissionChartVO> simpleAdmissionChartList(String paNo);
	
	public AdmissionChartVO simpleRoundsChartList(String admiNo);
	
	public AdmissionChartVO currentSimpleAdmissionChartList(String admiNo);
	
	public int createRoundsChart(ClinicChartVO clinicChartVO);
	
	public int updateRoundsChart(ClinicChartVO clinicChartVO);
}
