package kr.or.dduk.clinic.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.dduk.clinic.service.ClinicService;
import kr.or.dduk.mapper.ClinicChartMapper;
import kr.or.dduk.mapper.HospitalReceptionMapper;
import kr.or.dduk.util.SessionInfo;
import kr.or.dduk.vo.ClinicChartVO;
import kr.or.dduk.vo.HospitalReceptionVO;
import kr.or.dduk.vo.InjuryDiagnosisVO;
import kr.or.dduk.vo.InjuryVO;
import kr.or.dduk.vo.MedicineOrderVO;
import kr.or.dduk.vo.PatientVO;
import kr.or.dduk.vo.TestOrderVO;
import kr.or.dduk.vo.TreatmentOrderVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ClinicServiceImpl implements ClinicService {

	@Autowired
	ClinicChartMapper clinicChartMapper;
	
	@Autowired
	HospitalReceptionMapper hospitalReceptionMapper;
	
	@Autowired
	SessionInfo sessionInfo;
	
	
	/**
	 * 특정 환자의 진료정보들을 간략하게 가져오는 메서드
	 * 환자정보 클릭시 해당환자의 진료목록을 가져오기 위한 메서드
	 * @param paNo 환자번호
	 */
	@Override
	public PatientVO simpleClinicChartList(String paNo){
		return this.clinicChartMapper.simpleClinicChartList(paNo);
	}
	
	
	/**
	 * 특정 진료의 정보를 자세히 가져오는 메서드
	 * 환자의 진료목록에서 특정 진료를 클릭 시 해당 진료의 정보를 자세히 화면에 출력시켜주기 위한 메서드
	 * @param clinicNo 진료번호
	 */
	@Override
	public ClinicChartVO clinicChartDetail(String clinicNo) {
		return this.clinicChartMapper.clinicChartDetail(clinicNo);
	}
	
	
	/**
	 * 특정 진료의 정보를 자세히 가져오는 메서드
	 * 회진 페이지에서만 쓰려고 경량화한 쿼리
	 * @param clinicNo 진료번호
	 */
	@Override
	public ClinicChartVO lightWeightClinicChartDetail(String clinicNo) {
		return this.clinicChartMapper.clinicChartDetail(clinicNo);
	}
	
	
	/**
	 * 환자의 대기 목록에서 대기중인 환자를 클릭 시, 호출완료로 변경 및 진료차트 테이블에 데이터 생성
	 * @param	HospitalReceptionVO, hsrpNo(접수번호)와 paNo(환자번호)를 포함
	 * @return	Map<String, Object> 성공여부인 result와 진료번호인 clinicNo를 key값으로 가짐
	 */
	@Override
	public Map<String, Object> startClinicChart(@RequestBody HospitalReceptionVO hospitalReceptionVO){
		
		// 대기중인 환자를 호출완료로 변경
		String hsrpNo = hospitalReceptionVO.getHsrpNo();
		int result = this.hospitalReceptionMapper.updateReceptionState(hsrpNo);
		
		// 진료차트 테이블에 데이터 생성, 담당의, 환자번호, 진료상태, 진료번호를 설정해서 넣어줌
		ClinicChartVO clinicChartVO = new ClinicChartVO();
		String empNo = sessionInfo.getEmpNo();
		clinicChartVO.setEmpNo(empNo);
		clinicChartVO.setPaNo(hospitalReceptionVO.getPaNo());
		clinicChartVO.setClinicState("CRST01");
		clinicChartVO.setHsrpNo(hsrpNo);
		result += this.clinicChartMapper.insertClinicChart(clinicChartVO);
		String clinicNo = clinicChartVO.getClinicNo();
		
		// 결과값들을 map으로 return
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("result", result);
		map.put("clinicNo", clinicNo);
		return map;
	}
	
	
	/**
	 * 접수번호를 바탕으로 진료의 정보를 가져와서 리턴시켜주는 메소드
	 */
	@Override
	public ClinicChartVO continueClinicChart(String hsrpNo) {
		return this.clinicChartMapper.continueClinicChart(hsrpNo);
	}
	
	
	/**
	 * 진료차트를 업데이트시켜준다 (진료중>검사중, 검사완료>진료완료)
	 * @param clinicChartVO 업데이트 시킬 진료차트의 정보
	 * @return 성공여부
	 */
	@Override
	public int updateClinicChart(ClinicChartVO clinicChartVO) {
		
		// 진료차트 테이블을 업데이트 시켜준다
		int result = this.clinicChartMapper.updateClinicChart(clinicChartVO);
		
		// 접수번호로 진료번호를 가져온다(진단과 오더를 insert 시켜주기 위해)
		String clinicNo = this.clinicChartMapper.getClinicNoByHsrpNo(clinicChartVO.getHsrpNo());
		
		// 상병진단 업데이트
		List<InjuryDiagnosisVO> injuryDiagnosisVOList = clinicChartVO.getInjuryDiagnosisVOList();
		for(InjuryDiagnosisVO vo : injuryDiagnosisVOList) {
			vo.setClinicNo(clinicNo);
			result += this.clinicChartMapper.insertInjuryDiagnosis(vo);
		}
		
		// 검사오더 업데이트
		List<TestOrderVO> testOrderVOList = clinicChartVO.getTestOrderVOList();
		for(TestOrderVO vo : testOrderVOList) {
			vo.setClinicNo(clinicNo);
			result += this.clinicChartMapper.insertTestOrder(vo);
		}
		
		// 처방오더 업데이트
		List<MedicineOrderVO> medicineOrderVOList = clinicChartVO.getMedicineOrderVOList();
		for(MedicineOrderVO vo : medicineOrderVOList) {
			vo.setClinicNo(clinicNo);
			result += this.clinicChartMapper.insertMedicineOrder(vo);
		}
		
		// 치료오더 업데이트
		List<TreatmentOrderVO> treatmentOrderVO = clinicChartVO.getTreatmentOrderVOList();
		for(TreatmentOrderVO vo : treatmentOrderVO) {
			vo.setClinicNo(clinicNo);
			result += this.clinicChartMapper.insertTreatmentOrder(vo);
		}
		
		return result;
	}
	
	
	/**
	 * 진료차트의 진료상태를 업데이트해주는 메서드
	 * @param clinicChartVO 진료번호와 진료상태
	 * @return 성공여부
	 */
	@Override
	public int updateClinicState(ClinicChartVO clinicChartVO) {
		return this.clinicChartMapper.updateClinicState(clinicChartVO);
	}
	
	
	/**
	 * 입원번호로 진료번호 가져오는 쿼리
	 * @param hsrpNo 입원번호
	 * @return clinicNo 진료번호
	 */
	@Override
	public String getClinicNoByHsrpNo(String hsrpNo) {
		return this.clinicChartMapper.getClinicNoByHsrpNo(hsrpNo);
	}
}
