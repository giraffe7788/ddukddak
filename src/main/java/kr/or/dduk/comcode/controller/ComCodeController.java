package kr.or.dduk.comcode.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.dduk.comcode.service.ComCodeService;
import kr.or.dduk.employee.controller.EmployeeController;
import kr.or.dduk.vo.ComDetailCodeInfoVO;
import kr.or.dduk.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/comcode")
@Controller
public class ComCodeController {
	
	@Autowired
	ComCodeService comCodeService;
	
	/**
	 * 개인직책 조회
	 * @param employeeVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/detailCodeAjax")
	public List<ComDetailCodeInfoVO> detailCodeAjax(@RequestBody EmployeeVO employeeVO){
		log.info("detailCodeAjax -> employeeVO : " + employeeVO);
		
		String empJbpsCd = employeeVO.getEmpJbpsCd();
		log.info("detailCodeAjax -> empJbpsCd : " + empJbpsCd);
		
		List<ComDetailCodeInfoVO> comCodeDetdata = this.comCodeService.getComDetailCodeInfo(empJbpsCd);
		log.info("detailCodeAjax -> comCodeDetdata : " + comCodeDetdata);
			
		return comCodeDetdata;
	}
	
	/**
	 * 직무별 직책 목록 조회
	 * @param employeeVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/detailCodeListAjax")
	public List<ComDetailCodeInfoVO> detailCodeListAjax(@RequestBody EmployeeVO employeeVO){
		log.info("detailCodeListAjax -> employeeVO : " + employeeVO);
		
		String empDeptcd = employeeVO.getEmpDeptCd();
		//String keyword = empDeptCd+"%";
		log.info("detailCodeListAjax -> empDeptcd : " + empDeptcd);
		
		List<ComDetailCodeInfoVO> comCodeDetList = this.comCodeService.getComDetailCodeList(empDeptcd);
		log.info("detailCodeListAjax -> comCodeDetList : " + comCodeDetList);
			
		return comCodeDetList;
	}

	
	
}
