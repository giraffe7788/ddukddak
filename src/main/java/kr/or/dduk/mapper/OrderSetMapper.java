package kr.or.dduk.mapper;

import java.util.List;

import kr.or.dduk.vo.InjuryVO;
import kr.or.dduk.vo.MedicineVO;
import kr.or.dduk.vo.OrderSetVO;
import kr.or.dduk.vo.TestVO;
import kr.or.dduk.vo.TreatmentVO;

public interface OrderSetMapper {
	
	public List<OrderSetVO> getOrderSetList(String empNo);
	public int createOrderSet(OrderSetVO orderSetVO);
	public int deleteOrderSet(OrderSetVO orderSetVO);
	public List<InjuryVO> getInjuryVOList();
	public List<TestVO> getTestVOList();
	public List<MedicineVO> getMedicineVOList();
	public List<TreatmentVO> getTreatmentVOList();
	public InjuryVO getInjuryVODetail(String orderCode);
	public TestVO getTestVODetail(String orderCode);
	public MedicineVO getMedicineVODetail(String orderCode);
	public TreatmentVO getTreatmentVODetail(String orderCode);
}
