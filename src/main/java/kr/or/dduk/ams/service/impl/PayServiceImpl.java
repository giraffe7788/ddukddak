package kr.or.dduk.ams.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.dduk.ams.service.PayService;
import kr.or.dduk.mapper.AdmissionMapper;
import kr.or.dduk.mapper.PayMapper;
import kr.or.dduk.vo.AdmissionChartVO;
import kr.or.dduk.vo.PayRecordVO;
import kr.or.dduk.vo.PayVO;
import kr.or.dduk.vo.ReceiptVO;

@Service
public class PayServiceImpl implements PayService{
	
	@Autowired
	PayMapper payMapper;
	
	@Autowired
	AdmissionMapper admissionMapper;
	
	
	/**
	 * DB에서 수납 리스트를 모두 가져옴
	 * @return PayVOList 수납 리스트
	 */
	@Override
	public List<PayVO> getPayList(){
		return this.payMapper.getPayList();
	}
	
	
	/**
	 * DB에서 수납 상세를 가져옴
	 * @param payNo 수납번호
	 * @return payVO 수납상세
	 */
	@Override
	public PayVO getPayDetail(String payNo) {
		return this.payMapper.getPayDetail(payNo);
	}
	
	
	/**
	 * DB로 수납 기록을 넣음
	 * @param payRecordVO 수납 기록 정보
	 * @return 성공여부
	 */
	@Override
	public int insertPayRecord(PayRecordVO payRecordVO) {
		return this.payMapper.insertPayRecord(payRecordVO);
	}
	
	
	/**
	 * DB에 수납 테이블과 영수증 테이블을 insert시킨다
	 * @param PayVO 수납VO
	 * @return result 결과
	 */
	@Override
	public int insertPay(PayVO payVO) {
		
		ReceiptVO receiptVO = null;
		
		// 입원번호가 있으면 입원번호를 기준으로 영수증 가져옴
		if(payVO.getAdmiNo() != null && payVO.getAdmiNo() != "") {
			
			// DB에서 영수증 깡통 가져오기
			receiptVO = this.payMapper.getAdmissionReceipt(payVO.getAdmiNo());
			
		// 입원번호가 없으면 한 진료에 대한거만 가져옴
		} else {
			
			// DB에서 영수증 깡통 가져오기
			receiptVO = this.payMapper.getClinicReceipt(payVO.getClinicNo());
			
		}
		
		// 수납 테이블의 총 금액(보험 적용금) 계산
		String paInsuYn = this.payMapper.getPaInsuYN(payVO.getPaNo());
		// 만약 보험이 있으면
		if(paInsuYn.equals("ISYN01")) {
			payVO.setPayTotalmn(((int)(receiptVO.getRctTotal() * 0.2)/100) * 100);
		// 보험이 없으면
		} else {
			payVO.setPayTotalmn(receiptVO.getRctTotal());
		}
		
		
		int result = 0;
		result += this.payMapper.insertPay(payVO);
		
		// 영수증 테이블에 payNo를 넣음
		receiptVO.setPayNo(payVO.getPayNo());
		result += this.payMapper.insertReceipt(receiptVO);
		return result;
	}
	
	
	/**
	 * 수납 테이블의 수납 상태를 변경
	 * @param payVO 수납VO
	 * @return result 성공여부
	 */
	@Override
	public int updatePayState(PayVO payVO) {
		return this.payMapper.updatePayState(payVO);
	}
}
