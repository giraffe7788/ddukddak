package kr.or.dduk.clinic.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;

import kr.or.dduk.vo.ClinicChartVO;
import kr.or.dduk.vo.HospitalReceptionVO;
import kr.or.dduk.vo.PatientVO;

public interface ClinicService {
	
	public PatientVO simpleClinicChartList(String paNo);
	
	public ClinicChartVO clinicChartDetail(String clinicNo);
	
	public ClinicChartVO lightWeightClinicChartDetail(String clinicNo);
	
	public Map<String, Object> startClinicChart(HospitalReceptionVO hospitalReceptionVO);

	public ClinicChartVO continueClinicChart(String hsrpNo);
	
	public int updateClinicChart(ClinicChartVO clinicChartVO);
	
	public int updateClinicState(ClinicChartVO clinicChartVO);
	
	public String getClinicNoByHsrpNo(String hsrpNo);
}
