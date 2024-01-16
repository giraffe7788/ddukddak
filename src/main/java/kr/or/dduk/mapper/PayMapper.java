package kr.or.dduk.mapper;

import java.util.List;

import kr.or.dduk.vo.PayRecordVO;
import kr.or.dduk.vo.PayVO;
import kr.or.dduk.vo.ReceiptVO;

public interface PayMapper {
	public List<PayVO> getPayList();
	public PayVO getPayDetail(String payNo);
	public int insertPay(PayVO payVO);
	public int insertReceipt(ReceiptVO receiptVO);
	public int insertPayRecord(PayRecordVO payRecordVO);
	public int updatePayState(PayVO payVO);
	public ReceiptVO getAdmissionReceipt(String admiNo);
	public ReceiptVO getClinicReceipt(String clinicNo);
	public String getPaInsuYN(String paNo);
}
