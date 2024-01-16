package kr.or.dduk.ams.service;

import java.util.List;

import kr.or.dduk.vo.PayRecordVO;
import kr.or.dduk.vo.PayVO;

public interface PayService {
	public List<PayVO> getPayList();
	public PayVO getPayDetail(String payNo);
	public int insertPay(PayVO payVO);
	public int insertPayRecord(PayRecordVO payRecordVO);
	public int updatePayState(PayVO payVO);
}
