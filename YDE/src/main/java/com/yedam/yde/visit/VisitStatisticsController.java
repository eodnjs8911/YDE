package com.yedam.yde.visit;

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
@RequestMapping("/visit/")
public class VisitStatisticsController {

	@Autowired
	VisitStatisticsService visitStatisticsService;

	@ModelAttribute("conditionMap")
	public Map<String, String> SearchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("방문일", "VISIT_DATE");
		conditionMap.put("IP", "VISIT_IP");
		return conditionMap;
	}

	
	@RequestMapping("/selectListYearAdminPage.do")
	public String selectListYearAdminPage() {
		System.out.println("[VisitStatisticsController][selectListYearAdminPage]");
		return "admin_flot/visitCount";
	}
	
	// ip 누적방문 (ajax)
	@RequestMapping("getselectIp.do")
	@ResponseBody
	public List<Map<String,Object>> selectIp(VisitStatisticsSearchVO statistics, Model model) {
		return visitStatisticsService.selectIp(statistics);
	}

	// 년별 (ajax)
	@RequestMapping("selectListYear.do")
	@ResponseBody
	public List<Map<String,Object>> selectListYear(VisitStatisticsSearchVO statistics, Model model) {
		return visitStatisticsService.selectListYear(statistics);
	}

	// 월별 (ajax)
	@RequestMapping("selectListMonth.do")
	@ResponseBody
	public List<Map<String,Object>> selectListMonth(VisitStatisticsSearchVO statistics, Model model) {
		return visitStatisticsService.selectListMonth(statistics);
	}

	// 일별 (ajax)
	@RequestMapping("selectListDay.do")
	@ResponseBody
	public List<Map<String,Object>> selectListDay(VisitStatisticsSearchVO statistics, Model model) {
		return visitStatisticsService.selectListDay(statistics);
	}

}
