package kr.or.dduk.nurse.service.impl;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.multipart.MultipartFile;

import kr.or.dduk.mapper.EmployeeMapper;
import kr.or.dduk.mapper.WorkforceManagementMapper;
import kr.or.dduk.nurse.service.WorkforceManagementService;
import kr.or.dduk.vo.EmployeeVO;
import kr.or.dduk.vo.NurScheduleVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class WorkforceManagementServiceImpl implements WorkforceManagementService{
	
	@Autowired
	WorkforceManagementMapper workforceManagementMapper;
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	@Override
	public int createNurSchedule(MultipartFile file, Map<String, Object> parameterMap) {
		
		 if (!file.getOriginalFilename().endsWith(".xlsx")) {
	         return 0;
	      }
	      
	      List<Map<String, Object>> mapList = new ArrayList<Map<String,Object>>();
	      
	      try {
	         XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream());
	         XSSFSheet sheet = workbook.getSheetAt(0);
	         XSSFRow row = null;
	         XSSFCell cell = null;

	         List<String> categoryList = new ArrayList<String>();

	         log.info("rowNum ==> {}", sheet.getLastRowNum());
	         
	         for (int i = 0; i < sheet.getLastRowNum() + 1; i++) {
	            
	            Map<String, Object> map = new HashMap<String, Object>();
	            
	            row = sheet.getRow(i);
	            
	            log.info("cellNum ==> {}",row.getLastCellNum());
	            
	            for (int j = 0; j < row.getLastCellNum(); j++) {
	               
	               cell = row.getCell(j);
	               if (cell == null)
	                  continue;

	               if (i == 0) {
	                  categoryList.add(j, cell.getStringCellValue());
	                  continue;
	               } else {
	                  switch (cell.getCellType()) {
	                  case NUMERIC:
	                	  
	                	  if(DateUtil.isCellDateFormatted(cell)) {
	                		  Date date = cell.getDateCellValue();
	                		  
	                		  log.info("cellString(Date) ->" + date);
	                		  
	                		  map.put(categoryList.get(j), date);
	                	  }else {
	                		  String cellString = "";
	                		  cellString = String.valueOf((int)cell.getNumericCellValue());
	                		  log.info("cellString(Numeric) ->" + cellString);
	                		  map.put(categoryList.get(j), cellString);
	                		} 
	                	 
	                     break;
	                     
	                  case STRING:
	                     String StringCellValue = cell.getStringCellValue();
	                     log.info("cellString(String) ->" + StringCellValue);
	                     map.put(categoryList.get(j), StringCellValue);
	                     break;
	                     
	                  default:
	                     break;
	                  }
	               }
	            }
	            if (!map.isEmpty()) {
	               mapList.add(map);
	            }
	         }
	      } catch (IOException e) {
	         log.error(e.getMessage());
	      }
	      log.info("JYB ==> {}", mapList);
	      
	      log.info("size ==> {}", mapList.size());
	      
	      List<NurScheduleVO> nurSchduleList = new ArrayList<NurScheduleVO>();
	      
	      int sum = 1;
	      
	      for (Map<String, Object> map : mapList) {
	         
	    	  NurScheduleVO nurScheduleVO = new NurScheduleVO();
	         
	         map.forEach((key, value) -> {
	            if (key.equals("근무일자"   ))             nurScheduleVO.setNurscDt((Date)value);
	            else if (key.equals("사번"))       nurScheduleVO.setEmpNo((String)value);
	            else if (key.equals("근무구분"))       nurScheduleVO.setNurscType((String)value);
	            else if (key.equals("작성자"))       nurScheduleVO.setNurscWt((String)value);
	         });
	         
//	         String year = new SimpleDateFormat("yy").format(new Date());
//	         String colNo = studentVO.getStuCd().substring(5);
//	         String depNo = studentVO.getDepCd().substring(6);
//	         Map<String, String> paramMap = new HashMap<String, String>();
//	         paramMap.put("depCd", studentVO.getDepCd());
//	         paramMap.put("year", year);
//	         int cnt = this.stuAdminMapper.cntDepStu(paramMap) + sum;
//	         String strCnt = String.format("%03d", cnt);
//	         String userCd = year + colNo + depNo + strCnt;
//	         
//	         userVO.setUserCd(userCd);
//	         userVO.setComdCd("USER01");
//	         userVO.setUserPass(this.passwordEncoder.encode(userVO.getUserReg1()));
//	         
//	         
//	         studentVO.setStuCd(userCd);
	         
//	         log.info("userVO ==> {}\nstudentVO ==> {}", userVO, studentVO);
	         
	         nurSchduleList.add(nurScheduleVO);
	         sum++;
	      }
	      
	      int cnt = 0;
	      log.info("deleteParameterMap"+parameterMap);
	      cnt += this.workforceManagementMapper.deleteNurSchedule(parameterMap);
	      
	      for(NurScheduleVO nurScheduleVO : nurSchduleList) {
	    	  cnt += this.workforceManagementMapper.createNurSchedule(nurScheduleVO);
	      }
	      
	      return cnt;
	}

	@Override
	public List<NurScheduleVO> getNurScheduleList(Map<String, Object> map) {
		return this.workforceManagementMapper.getNurScheduleList(map);
	}

	@Override
	public List<EmployeeVO> getNurseList() {
		return this.employeeMapper.getNurseList();
	}

	@Override
	public byte[] createWorkforceExcel(Map<String, Object> map){
		try {
			XSSFWorkbook wb= new XSSFWorkbook();
			XSSFSheet sheet=null;
			XSSFRow row=null;
			XSSFCell cell=null; 
			
			String year = (String) map.get("year");
			String month = (String) map.get("month");
			
			sheet = wb.createSheet(year+"_"+month+"_간호근무일정");
	
			List<NurScheduleVO> nurScheduleVOList = this.workforceManagementMapper.createWorkforceExcel(map);
			
			
			// 열 이름 표기용 row(행) 생성
			int cellCount=0;
			row = sheet.createRow(0); //0번째 행
			cell=row.createCell(cellCount++);
			cell.setCellValue("No");
			cell=row.createCell(cellCount++);
			cell.setCellValue("날짜");
			cell=row.createCell(cellCount++);
			cell.setCellValue("사번");
			cell=row.createCell(cellCount++);
			cell.setCellValue("이름");
			cell=row.createCell(cellCount++);
			cell.setCellValue("근무유형");
			
			//데이터 가져오기
			for(int i=0; i<nurScheduleVOList.size(); i++) {
				row=sheet.createRow(i+1);
				cellCount=0; //열 번호 초기화
				cell = row.createCell(cellCount++);
				cell.setCellValue(i);
				
				//Date 처리
				Date nurscDt = nurScheduleVOList.get(i).getNurscDt();
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				String nurscDtStr = simpleDateFormat.format(nurscDt);
				cell = row.createCell(cellCount++);
				cell.setCellValue(nurscDtStr);
				
				cell = row.createCell(cellCount++);
				cell.setCellValue(nurScheduleVOList.get(i).getEmpNo());
				cell = row.createCell(cellCount++);
				cell.setCellValue(nurScheduleVOList.get(i).getEmpName());
				cell = row.createCell(cellCount++);
				cell.setCellValue(nurScheduleVOList.get(i).getNurscType());
			}
	
			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			wb.write(outputStream);
			wb.close();
	
	        return outputStream.toByteArray();
		 } catch (Exception e) {
		        e.printStackTrace();
		        // 예외 메시지를 로깅하거나 반환하여 클라이언트에게 전달
		        throw new RuntimeException("엑셀 생성 중 오류 발생: " + e.getMessage());
		}
	}
}
