package com.yedam.yde.expressSales;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.yde.employee.EmployeeVO;

@Controller
@RequestMapping("/expressSales/")
public class ExpressSalesController {

	@Autowired
	ExpressSalesService expressSalesService;

	@ModelAttribute("conditionMap")
	public Map<String, String> SearchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("매출", "EXPRESS_ESTIMATE_AMOUNT");
		conditionMap.put("이사일", "EXPRESS_DATE");
		return conditionMap;
	}

	@RequestMapping("/selectListYearSalesAdminPage.do")
	public String selectListYearAdminPage() {
		System.out.println("[ExpressSalesController][selectListYearAdminPage]");
		return "admin_flot/expressSales";
	}
	
	// 월별 (ajax)
	@RequestMapping("selectListMonth.do")
	@ResponseBody
	public List<Map<String,Object>> selectListMonth(ExpressSalesVO vo, Model model) {
		return expressSalesService.selectListMonth(vo);
	}

	// 년별 (ajax)
		@RequestMapping("selectListYear.do")
		@ResponseBody
		public List<Map<String,Object>> selectListYear(ExpressSalesVO vo, Model model) {
			return expressSalesService.selectListYear(vo);
		}
		
}
