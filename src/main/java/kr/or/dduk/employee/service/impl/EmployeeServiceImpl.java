package kr.or.dduk.employee.service.impl;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dduk.employee.service.EmployeeService;
import kr.or.dduk.mapper.EmployeeMapper;
import kr.or.dduk.vo.ComDetailCodeInfoVO;
import kr.or.dduk.vo.DocOfficeVO;
import kr.or.dduk.vo.DocScheduleVO;
import kr.or.dduk.vo.EmployeeVO;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	EmployeeMapper employeeMapper;

	@Override
	public int create(EmployeeVO employeeVO) {
		return this.employeeMapper.create(employeeVO);
	}

	@Override
	public EmployeeVO detail(String empNo) {
		return this.employeeMapper.detail(empNo);
	}

	@Override
	public int update(EmployeeVO employeeVO) {
		return this.employeeMapper.update(employeeVO);
	}

	@Override
	public String getNewNo() {
		return this.employeeMapper.getNewNo();
	}

	@Override
	public List<EmployeeVO> getDoctorList() {
		return this.employeeMapper.getDoctorList();
	}

	@Override
	public EmployeeVO authCheck(String empNo) {
		return this.employeeMapper.getMemberAuth(empNo);
	}

	@Override
	public List<EmployeeVO> getAllEmp() {
		return this.employeeMapper.getAllEmp();
	}
	
	@Override
	public List<EmployeeVO> getPermEmpList() {
		return this.employeeMapper.getPermEmpList();
	}

	@Override
	public EmployeeVO getHrdDetail(String empNo) {
		return this.employeeMapper.getHrdDetail(empNo);
	}

	@Override
	public List<EmployeeVO> getSttDetail(String empAcntState) {
		return this.employeeMapper.getSttDetail(empAcntState);
	}

	@Override
	public int updateStt(EmployeeVO employeeVO) {
		return this.employeeMapper.updateStt(employeeVO);
	}

	@Override
	public List<EmployeeVO> getFirstApprovalHolder() {
		return this.employeeMapper.getFirstApprovalHolder();
	}

	@Override
	public List<EmployeeVO> getSecondApprovalHolder() {
		return this.employeeMapper.getSecondApprovalHolder();
	}

	@Override
	public List<EmployeeVO> getAllDoctorDetail() {
		return this.employeeMapper.getAllDoctorDetail();
	}

	@Override
	public DocScheduleVO getPresentSchedule(String empNo) {
		return this.employeeMapper.getPresentSchedule(empNo);
	}

	@Override
	public int assignDoctorToClinicRoom(DocOfficeVO docOfficeVO) {
		return this.employeeMapper.assignDoctorToClinicRoom(docOfficeVO);
	}

	@Override
	public int removeDoctorFromClinicRoom(String doNo) {
		return this.employeeMapper.removeDoctorFromClinicRoom(doNo);
	}

	@Override
	public List<HashMap<String, Object>> workingEmpListA() {
		return this.employeeMapper.workingEmpListA();
	}

	@Override
	public List<HashMap<String, Object>> inEmpListA() {
		// 원본 리스트 가져오기
	    List<HashMap<String, Object>> originalList = this.employeeMapper.inEmpListA();
	    // 새로운 리스트 생성 (원본 리스트를 변경하지 않기 위해)
	    List<HashMap<String, Object>> modifiedList = new ArrayList();
	    
	    for (HashMap<String, Object> item : originalList) {
	    	Object joinYearO = item.get("JOINYEAR");
	    	String test = "20" + String.valueOf(joinYearO);
	    	// 현재 연도
	    	LocalDate now = LocalDate.now();
	    	int currentYear = now.getYear();
	    	int outYear = Integer.parseInt(test);
            // 5년 이내 연도만 가져옴
            if (currentYear - 5 <= outYear) {
                item.put("JOINYEAR", test);

                // 변경된 항목을 새로운 리스트에 추가
                modifiedList.add(item);
            }
	    	
	    }

	    return modifiedList;
	}

	@Override
	public List<HashMap<String, Object>> outEmpListA() {
		// 원본 리스트 가져오기
	    List<HashMap<String, Object>> originalList = this.employeeMapper.outEmpListA();
	    // 새로운 리스트 생성 (원본 리스트를 변경하지 않기 위해)
	    List<HashMap<String, Object>> modifiedList = new ArrayList();
	    
	    for (HashMap<String, Object> item : originalList) {
	    	Object outYearO = item.get("OUTYEAR");
	    	String test = "";
	    	// 퇴사 안한 사람 숫자는 제외
	    	if(outYearO != null) {
	    		test = "20" + String.valueOf(outYearO);
	    	}
	    	
	    	// 현재 연도
	    	LocalDate now = LocalDate.now();
	    	int currentYear = now.getYear();
	    	int outYear = 0;
	    	
	    	// test가 빈 문자열 또는 변환 불가능한 경우 예외 처리
	        try {
	        	// 입사 연도
	            outYear = Integer.parseInt(test);
	            // 5년 이내 연도만 가져옴
	            if (currentYear - 4 <= outYear) {
	                item.put("OUTYEAR", test);
	                
	                // 변경된 항목을 새로운 리스트에 추가
	    	        modifiedList.add(item);
	            }
	        } catch (NumberFormatException e) {
	            System.err.println("Invalid OUTYEAR format: " + test);
	        }
	    	
	    }

	    return modifiedList;
	}

	@Override
	public List<HashMap<String, Object>> genEmpListA() {
		// 원본 리스트 가져오기
	    List<HashMap<String, Object>> originalList = this.employeeMapper.genEmpListA();
	    // 새로운 리스트 생성 (원본 리스트를 변경하지 않기 위해)
	    List<HashMap<String, Object>> modifiedList = new ArrayList();
	    
		// 1,3이면 남자 / 2,4면 여자로 해서 여자 남자로 표기 바꿈
	    for (HashMap<String, Object> item : originalList) {
	    	Object genO = item.get("GEN");
	        String strGenO = (String) genO; // 형변환
	        switch (strGenO) {
		        case "1":
		        case "3":
		            item.put("GEN", "남자");
		            break;
		        case "2":
		        case "4":
		            item.put("GEN", "여자");
		            break;
		    }
	     // 변경된 항목을 새로운 리스트에 추가
	     modifiedList.add(item);
	    }
		// 직무별로 새 리스트에 담음
		return modifiedList;
	}


}
