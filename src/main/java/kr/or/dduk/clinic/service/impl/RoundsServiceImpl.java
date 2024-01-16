package kr.or.dduk.clinic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.dduk.clinic.service.RoundsService;
import kr.or.dduk.mapper.ClinicChartMapper;
import kr.or.dduk.mapper.RoundsMapper;
import kr.or.dduk.util.SessionInfo;
import kr.or.dduk.vo.AdmissionChartVO;
import kr.or.dduk.vo.ClinicChartVO;
import kr.or.dduk.vo.MedicineOrderVO;
import kr.or.dduk.vo.PatientVO;
import kr.or.dduk.vo.TestOrderVO;
import kr.or.dduk.vo.TreatmentOrderVO;

@Service
public class RoundsServiceImpl implements RoundsService {

	@Autowired
	RoundsMapper roundsMapper;

	@Autowired
	ClinicChartMapper clinicChartMapper;

	@Autowired
	SessionInfo sessionInfo;

	/**
	 * 회진 페이지 에서 과거 입원내역 리스트를 뽑아오기 위한 메서드
	 * 
	 * @param paNo 환자번호
	 * @return 과거 입원내역 리스트
	 */
	@Override
	public List<AdmissionChartVO> simpleAdmissionChartList(String paNo) {
		return this.roundsMapper.simpleAdmissionChartList(paNo);
	}

	/**
	 * 회진 페이지에서 과거 입원내역 리스트중 특정 입원 클릭시 실행되는 메서드 해당 입원에서 받은 심플 회진 리스트를 받아옴
	 * 
	 * @param admiNo 입원번호
	 * @return 회진내역 리스트
	 */
	@Override
	public AdmissionChartVO simpleRoundsChartList(String admiNo) {
		return this.roundsMapper.simpleRoundsChartList(admiNo);
	}

	/**
	 * 회진 페이지에서 현재 입원 정보와 현재 입원에서 실행한 모든 회진 정보를 가져와서 리스트로 만들어줌
	 * 
	 * @param admiNo 입원번호
	 * @return 입원일, 예상퇴원일, 담당의, 진료날짜 진료상태 진료코드만
	 */
	@Override
	public AdmissionChartVO currentSimpleAdmissionChartList(String admiNo) {
		return this.roundsMapper.currentSimpleAdmissionChartList(admiNo);
	}

	/**
	 * 회진 페이지에서 회진을 시작하고 저장을 누를 때 저장시키는 메서드
	 * 
	 * @param ClinicVO 회진차트
	 * @return result 성공여부
	 */
	@Override
	public int createRoundsChart(ClinicChartVO clinicChartVO) {
		int result = 0;
		// 담당의에 현재 접속중인 사번을 넣어줌
		clinicChartVO.setEmpNo(sessionInfo.getEmpNo());
		result += this.roundsMapper.createRoundsChart(clinicChartVO);
		// 방금 들어간 clinicNo를 가져옴
		String clinicNo = clinicChartVO.getClinicNo();

		// 검사오더 insert
		List<TestOrderVO> testOrderVOList = clinicChartVO.getTestOrderVOList();
		for (TestOrderVO vo : testOrderVOList) {
			vo.setClinicNo(clinicNo);
			result += this.clinicChartMapper.insertTestOrder(vo);
		}

		// 처방오더 insert
		List<MedicineOrderVO> medicineOrderVOList = clinicChartVO.getMedicineOrderVOList();
		for (MedicineOrderVO vo : medicineOrderVOList) {
			vo.setClinicNo(clinicNo);
			result += this.clinicChartMapper.insertMedicineOrder(vo);
		}

		// 치료오더 insert
		List<TreatmentOrderVO> treatmentOrderVO = clinicChartVO.getTreatmentOrderVOList();
		for (TreatmentOrderVO vo : treatmentOrderVO) {
			vo.setClinicNo(clinicNo);
			result += this.clinicChartMapper.insertTreatmentOrder(vo);
		}

		return result;
	}
	
	
	/** 
	 * 회진 페이지에서 검사가 완료된 회진을 이어하고, 저장을 누를 때 갱신시키는 메서드
	 * @param ClinicVO 회진정보
	 * @return result 성공여부
	 */
	@Override
	public int updateRoundsChart(ClinicChartVO clinicChartVO) {
		int result = 0;
		// 회진차트부터 업데이트
		result += this.roundsMapper.updateRoundsChart(clinicChartVO);
		
		String clinicNo = clinicChartVO.getClinicNo();
		
		// 검사오더 insert
		List<TestOrderVO> testOrderVOList = clinicChartVO.getTestOrderVOList();
		for (TestOrderVO vo : testOrderVOList) {
			vo.setClinicNo(clinicNo);
			result += this.clinicChartMapper.insertTestOrder(vo);
		}

		// 처방오더 insert
		List<MedicineOrderVO> medicineOrderVOList = clinicChartVO.getMedicineOrderVOList();
		for (MedicineOrderVO vo : medicineOrderVOList) {
			vo.setClinicNo(clinicNo);
			result += this.clinicChartMapper.insertMedicineOrder(vo);
		}

		// 치료오더 insert
		List<TreatmentOrderVO> treatmentOrderVO = clinicChartVO.getTreatmentOrderVOList();
		for (TreatmentOrderVO vo : treatmentOrderVO) {
			vo.setClinicNo(clinicNo);
			result += this.clinicChartMapper.insertTreatmentOrder(vo);
		}
		
		return result;
	}
}
