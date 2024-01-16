package kr.or.dduk.clinic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.dduk.clinic.service.OrderSetService;
import kr.or.dduk.mapper.OrderSetMapper;
import kr.or.dduk.util.SessionInfo;
import kr.or.dduk.vo.InjuryVO;
import kr.or.dduk.vo.MedicineVO;
import kr.or.dduk.vo.OrderSetVO;
import kr.or.dduk.vo.TestVO;
import kr.or.dduk.vo.TreatmentVO;
import lombok.extern.slf4j.Slf4j;

@Service
public class OrderSetServiceImpl implements OrderSetService{
	
	@Autowired
	OrderSetMapper orderSetMapper;
	
	@Autowired
	SessionInfo sessionInfo;
	
	/**
	 * 로그인한 의사의 사번으로 DB에서 오더세트VO 리스트를 가져와서 오더세트에 출력
	 */
	@Override
	public List<OrderSetVO> getOrderSetList(){
		String empNo = sessionInfo.getEmpNo();
		return this.orderSetMapper.getOrderSetList(empNo);
	}
	
	/**
	 * 오더세트 추가 모달에서 오더세트를 추가
	 */
	@Override
	public int createOrderSet(OrderSetVO orderSetVO) {
		String empNo = sessionInfo.getEmpNo();
		orderSetVO.setEmpNo(empNo);
		return this.orderSetMapper.createOrderSet(orderSetVO);
	}
	
	/**
	 * 오더세트 삭제시키는 함수
	 */
	@Override
	@Transactional
	public int deleteOrderSet(List<OrderSetVO> orderSetVOList) {
		
		int result = 0;
		String empNo = sessionInfo.getEmpNo();
		
		for(OrderSetVO orderSetVO : orderSetVOList) {
			orderSetVO.setEmpNo(empNo);
			orderSetVO.setOrderSetOrdcd(null);
			result += this.orderSetMapper.deleteOrderSet(orderSetVO);
		}
		
		return result;
	}
	
	/**
	 * 오더세트 추가 모달 에서 오더카테고리 선택에 따른 검색 풀 갱신
	 * InjuryVO의 List 리턴
	 */
	@Override
	public List<InjuryVO> getInjuryVOList(){
		return this.orderSetMapper.getInjuryVOList();
	}
	
	/**
	 * 오더세트 추가 모달 에서 오더카테고리 선택에 따른 검색 풀 갱신
	 * TestVO의 List 리턴
	 */
	@Override
	public List<TestVO> getTestVOList(){
		return this.orderSetMapper.getTestVOList();
	}
	
	/**
	 * 오더세트 추가 모달 에서 오더카테고리 선택에 따른 검색 풀 갱신
	 * MedicineVO의 List 리턴
	 */
	@Override
	public List<MedicineVO> getMedicineVOList(){
		return this.orderSetMapper.getMedicineVOList();
	}
	
	/**
	 * 오더세트 추가 모달 에서 오더카테고리 선택에 따른 검색 풀 갱신
	 * TreatmentVO의 List 리턴
	 */
	@Override
	public List<TreatmentVO> getTreatmentVOList(){
		return this.orderSetMapper.getTreatmentVOList();
	}
	
	/**
	 * 오더세트에서 오더선택 후 본문에 반영할 때 자세한 정보를 가져오는 메소드
	 * InjuryVO를 리턴
	 */
	@ResponseBody
	@PostMapping("/getInjuryVODetail")
	public InjuryVO getInjuryVODetail(String orderCode){
		return this.orderSetMapper.getInjuryVODetail(orderCode);
	}
	
	/**
	 * 오더세트에서 오더선택 후 본문에 반영할 때 자세한 정보를 가져오는 메소드
	 * TestVO를 리턴
	 */
	@ResponseBody
	@PostMapping("/getTestVODetail")
	public TestVO getTestVODetail(String orderCode){
		return this.orderSetMapper.getTestVODetail(orderCode);
	}
	
	/**
	 * 오더세트에서 오더선택 후 본문에 반영할 때 자세한 정보를 가져오는 메소드
	 * MedicineVO를 리턴
	 */
	@ResponseBody
	@PostMapping("/getMedicineVODetail")
	public MedicineVO getMedicineVODetail(String orderCode){
		return this.orderSetMapper.getMedicineVODetail(orderCode);
	}
	
	/**
	 * 오더세트에서 오더선택 후 본문에 반영할 때 자세한 정보를 가져오는 메소드
	 * TreatmentVO를 리턴
	 */
	@ResponseBody
	@PostMapping("/getTreatmentVODetail")
	public TreatmentVO getTreatmentVODetail(String orderCode){
		return this.orderSetMapper.getTreatmentVODetail(orderCode);
	}
}
