package kr.or.dduk.ams.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.dduk.ams.service.PayService;
import kr.or.dduk.vo.PayRecordVO;
import kr.or.dduk.vo.PayVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ams")
public class PayController {

	@Autowired
	PayService payService;
	
	
	/**
	 * 수납 페이지로 이동
	 */
	@GetMapping("/pay")
	public void amsPay() {
		
	}
	
	
	/**
	 * DB에서 수납 리스트를 모두 가져옴
	 * @return PayVOList 수납 리스트
	 */
	@ResponseBody
	@PostMapping("/getPayList")
	public List<PayVO> getPayList(){
		return this.payService.getPayList();
	}
	
	
	/**
	 * DB에서 수납 상세를 가져옴
	 * @param payNo 수납번호
	 * @return payVO 수납상세
	 */
	@ResponseBody
	@PostMapping("/getPayDetail")
	public PayVO getPayDetail(String payNo) {
		return this.payService.getPayDetail(payNo);
	}
	
	
	/**
	 * DB로 수납 기록을 넣음
	 * @param payRecordVO 수납 기록 정보
	 * @return 성공여부
	 */
	@ResponseBody
	@PostMapping("/insertPayRecord")
	public int insertPayRecord(@RequestBody PayRecordVO payRecordVO) {
		return this.payService.insertPayRecord(payRecordVO);
	}
	
	
	/**
	 * 수납 테이블의 수납 상태를 변경
	 * @param payVO 수납VO
	 * @return result 성공여부
	 */
	@ResponseBody
	@PostMapping("/updatePayState")
	public int updatePayState(@RequestBody PayVO payVO) {
		return this.payService.updatePayState(payVO);
	}
}
