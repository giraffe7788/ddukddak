package kr.or.dduk.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ClinicChartVO {

	private String clinicNo;		// 진료번호
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date clinicDt;			// 진료일시
	private Date clinicDetailDt;	// 진료일시(포맷 바꾸기위해 선언했다리)
	private String clinicOpinion;	// 소견
	private String hsrpNo;			// 접수번호
	private String empNo;			// 담당의 사번
	private String paNo;			// 환자번호
	private String clinicInjnm;		// 진단명
	private String admiCd;			// 입원코드
	private String clinicState;		// 진료상태
	
	private List<InjuryDiagnosisVO> injuryDiagnosisVOList;	// 상병진단 리스트
	private List<TestOrderVO> 		testOrderVOList;		// 검사오더 리스트
	private List<MedicineOrderVO> 	medicineOrderVOList;	// 처방오더 리스트
	private List<TreatmentOrderVO>  treatmentOrderVOList;	// 치료오더 리스트
	private List<ProofApplicationVO> proofApplicationVOList;// 제증명 리스트
	
	// 조인을 위해 넣은 변수
	private String empName;			// 담당의 이름
}
