package kr.or.dduk.nurse.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.maven.doxia.logging.Log;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.dduk.mapper.WorkforceManagementMapper;
import kr.or.dduk.vo.NurScheduleVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/excels")
public class ExcelController {
	@Autowired
	WorkforceManagementMapper workforceManagementMapper;
	
	@GetMapping
    public void download(HttpServletResponse response,String year,String month) throws IOException {
		Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("첫번째 시트");
        int rowNum = 0;
        Cell cell = null;
        Row row = null;
        
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("year", year);
        map.put("month", month);
        
        List<NurScheduleVO> nurScheduleVOList = this.workforceManagementMapper.createWorkforceExcel(map);
        log.info("download->nurScheduleVOList : " + nurScheduleVOList);
 
        // Header
        int cellNum = 0;
        row = sheet.createRow(rowNum++);
        cell = row.createCell(cellNum++);
        cell.setCellValue("No");
        cell = row.createCell(cellNum++);
        cell.setCellValue("날짜");
        cell = row.createCell(cellNum++);
        cell.setCellValue("사번");
        cell = row.createCell(cellNum++);
        cell.setCellValue("이름");
        cell = row.createCell(cellNum++);
        cell.setCellValue("근무유형");
 
        // Body
        for (NurScheduleVO nurScheduleVO : nurScheduleVOList) {
            cellNum = 0;
            row = sheet.createRow(rowNum++);
            cell = row.createCell(cellNum++);
            cell.setCellValue(rowNum);
            
            //Date 처리
			Date nurscDt = nurScheduleVO.getNurscDt();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String nurscDtStr = simpleDateFormat.format(nurscDt);
			cell = row.createCell(cellNum++);
			cell.setCellValue(nurscDtStr);
			
			cell = row.createCell(cellNum++);
			cell.setCellValue(nurScheduleVO.getEmpNo());
			cell = row.createCell(cellNum++);
			cell.setCellValue(nurScheduleVO.getEmpName());
			cell = row.createCell(cellNum++);
			cell.setCellValue(nurScheduleVO.getNurscType());
        }
 
        // Download
        response.setContentType("ms-vnd/excel");
        response.setHeader("Content-Disposition", "attachment;filename=student.xlsx");
        try {
            wb.write(response.getOutputStream());
        } finally {
            wb.close();
        }
    }
	
	public void download2(HttpServletResponse response,int year,int month) throws IOException {
		Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("첫번째 시트");
        int rowNum = 0;
        Cell cell = null;
        Row row = null;
 
        // Header
        int cellNum = 0;
        row = sheet.createRow(rowNum++);
        cell = row.createCell(cellNum++);
        cell.setCellValue("번호");
        cell = row.createCell(cellNum++);
        cell.setCellValue("이름");
 
        // Body
        for (int i = 1; i <= 3; i++) {
            cellNum = 0;
            row = sheet.createRow(rowNum++);
            cell = row.createCell(cellNum++);
            cell.setCellValue(i);
            cell = row.createCell(cellNum++);
            cell.setCellValue("학생" + i);
        }
 
        // Download
        response.setContentType("ms-vnd/excel");
        response.setHeader("Content-Disposition", "attachment;filename=student.xlsx");
        try {
            wb.write(response.getOutputStream());
        } finally {
            wb.close();
        }
    }
}
