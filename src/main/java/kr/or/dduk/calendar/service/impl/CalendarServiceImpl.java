package kr.or.dduk.calendar.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dduk.calendar.service.CalendarService;
import kr.or.dduk.mapper.CalendarMapper;
import kr.or.dduk.mapper.EmployeeMapper;
import kr.or.dduk.util.SessionInfo;
import kr.or.dduk.vo.DocScheduleVO;
import kr.or.dduk.vo.EmployeeVO;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	SessionInfo sessionInfo;
	
	@Autowired
	CalendarMapper calendarMapper;
	
	@Autowired
	EmployeeMapper employeeMapper;

	@Override
	public int createSch(DocScheduleVO docScheduleVO) {
		String empNo = sessionInfo.getEmpNo();
		docScheduleVO.setEmpNo(empNo);
		
		return this.calendarMapper.createSch(docScheduleVO);
	}

	@Override
	public int deleteSch(String dsNo) {
		return this.calendarMapper.deleteSch(dsNo);
	}

	@Override
	public List<DocScheduleVO> schList(String year) {
		return this.calendarMapper.schList(year);
	}

	@Override
	public DocScheduleVO selectSch(String dsNo) {
		return this.calendarMapper.selectSch(dsNo);
	}

	@Override
	public int updateSch(DocScheduleVO docScheduleVO) {
		return this.calendarMapper.updateSch(docScheduleVO);
	}

	@Override
	public List<DocScheduleVO> selectByDate(Map<String, Object> map) {
		return this.calendarMapper.selectByDate(map);
	}

	@Override
	public List<DocScheduleVO> schListEmpNo(Map<String, Object> map) {
		return this.calendarMapper.schListEmpNo(map);
	}

	@Override
	public List<HashMap<String, Object>> docSchListA(String month) {
		return this.calendarMapper.docSchListA(month);
	}

	@Override
	public List<HashMap<String, Object>> nurSchListA(String month) {
		// 원본 리스트 가져오기
	    List<HashMap<String, Object>> originalList = this.calendarMapper.nurSchListA(month);
	    // 새로운 리스트 생성 (원본 리스트를 변경하지 않기 위해)
	    List<HashMap<String, Object>> modifiedList = new ArrayList();
	    
		// NSTY01이면 데이 / NSTY02이면 이브닝 / NSTY03이면 나이트 / NSTY04이면 병가 / NSTY05이면 휴가 
	    for (HashMap<String, Object> item : originalList) {
	    	Object genO = item.get("NURSC_TYPE");
	        String strGenO = (String) genO; // 형변환
	        switch (strGenO) {
		        case "NSTY01":
		        	item.put("GEN", "데이");
		            break;
		        case "NSTY02":
		            item.put("GEN", "이브닝");
		            break;
		        case "NSTY03":
		        	item.put("GEN", "나이트");
		            break;
		        case "NSTY04":
		            item.put("GEN", "병가");
		            break;
		        case "NSTY05":
		            item.put("GEN", "휴가");
		            break;
		    }
	     // 변경된 항목을 새로운 리스트에 추가
	     modifiedList.add(item);
	    }
		// 직무별로 새 리스트에 담음
		return modifiedList;
	}

	@Override
	public List<DocScheduleVO> schListByDoc(Map<String, Object> map) {
		return this.calendarMapper.schListByDoc(map);
	}


}
