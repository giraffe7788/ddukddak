package kr.or.dduk.clinic.service;

import java.util.List;

import kr.or.dduk.vo.InjuryVO;
import kr.or.dduk.vo.MedicineVO;
import kr.or.dduk.vo.OrderSetVO;
import kr.or.dduk.vo.TestVO;
import kr.or.dduk.vo.TreatmentVO;

public interface OrderSetService {
	
	public List<OrderSetVO> getOrderSetList();
	public int createOrderSet(OrderSetVO orderSetVO);
	public int deleteOrderSet(List<OrderSetVO> orderSetVOList);
	public List<InjuryVO> getInjuryVOList();
	public List<TestVO> getTestVOList();
	public List<MedicineVO> getMedicineVOList();
	public List<TreatmentVO> getTreatmentVOList();
	public InjuryVO getInjuryVODetail(String orderCode);
	public TestVO getTestVODetail(String orderCode);
	public MedicineVO getMedicineVODetail(String orderCode);
	public TreatmentVO getTreatmentVODetail(String orderCode);
}
