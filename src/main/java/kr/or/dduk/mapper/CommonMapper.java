package kr.or.dduk.mapper;

import java.util.List;

import kr.or.dduk.vo.AtchFileDetailVO;
import kr.or.dduk.vo.DocOfficeVO;
import kr.or.dduk.vo.EmployeeVO;
import kr.or.dduk.vo.PatientRecordVO;
import kr.or.dduk.vo.PatientVO;

public interface CommonMapper {
	public List<PatientVO> list();

	public int createPatientPost(PatientVO patientVO);

	public List<PatientRecordVO> patientRecordList(String paNo);

	public int createPatientRecordPost(PatientRecordVO patientRecordVO);

	public List<PatientVO> searchPatient(String paName);

	public PatientVO searchPatientByNo(String paNo);

	public int updatePatientPost(PatientVO patientVO);

	public AtchFileDetailVO getFileDetail(String atchFileCd);

	public List<DocOfficeVO> getOfficesCondition();

	public List<PatientVO> getPatientList();
}
