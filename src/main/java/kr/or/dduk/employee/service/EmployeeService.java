package kr.or.dduk.employee.service;

import java.util.HashMap;
import java.util.List;

import kr.or.dduk.vo.DocOfficeVO;
import kr.or.dduk.vo.DocScheduleVO;
import kr.or.dduk.vo.EmployeeVO;

public interface EmployeeService {

	// 회원 등록
	public int create(EmployeeVO employeeVO);

	// 회원 조회
	public EmployeeVO detail(String empNo);

	// 회원 수정
	public int update(EmployeeVO employeeVO);

	// 마지막 사번 조회
	public String getNewNo();

	// 의사 리스트 가져오기
	public List<EmployeeVO> getDoctorList();

	
	// 일정 권한 체크
	public EmployeeVO authCheck(String empNo);
	

	// 인사과 회원관리 - 사원 목록 가져오기
	public List<EmployeeVO> getAllEmp();

	// 인사과 회원관리 - 승인 관련 사원 목록 가져오기
	public List<EmployeeVO> getPermEmpList();

	// 인사과 회원관리 - 사원 정보(직책 이름, 직무 이름, 파일 이름 같이 가져옴)
	public EmployeeVO getHrdDetail(String empNo);

	// 인사과 회원관리 - 상태정보로 같은 상태 사원 목록 가져오기
	public List<EmployeeVO> getSttDetail(String empAcntState);

	// 인사과 회원관리 - 선택한 사번의 상태 변경
	public int updateStt(EmployeeVO employeeVO);

	
	// 첫번째 결재권자 가져오기
	public List<EmployeeVO> getFirstApprovalHolder();
	// 최종결재권자 가져오기
	public List<EmployeeVO> getSecondApprovalHolder();

	// 진료실 배정 - 의사 디테일 목록 가져오기
	public List<EmployeeVO> getAllDoctorDetail();

	// 진료실 배정 - 지금 시각 의사 일정 가져오기
	public DocScheduleVO getPresentSchedule(String empNo);

	// 진료실 배정 - 의사 배정하기
	public int assignDoctorToClinicRoom(DocOfficeVO docOfficeVO);

	// 진료실 배정 - 의사 배정 취소하기
	public int removeDoctorFromClinicRoom(String doNo);

	// 부서별 전체 재직중인 사원 수 -통계용
	public List<HashMap<String, Object>> workingEmpListA();

	// 연도별 입사 사원 수
	public List<HashMap<String, Object>> inEmpListA();

	// 연도별 퇴사 사원 수
	public List<HashMap<String, Object>> outEmpListA();

	// 부서별 사원 수 성별따라
	public List<HashMap<String, Object>> genEmpListA();

}
