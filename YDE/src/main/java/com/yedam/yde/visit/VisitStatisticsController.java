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
	
/*	// 목록 (ajax)
	@RequestMapping("getVisitStatisticsList.do")
	@ResponseBody // JSON 또는 XML로 변환
	public List<VisitStatisticsSearchVO> getVisitStatisticsList() {

		return VisitStatisticsSearchVO.getVisitStatisticsList(null);
	}*/
	
	// 목록 (ajax)
		@RequestMapping("getVisitStatisticsList.do")
		@ResponseBody 
		public String getVisitStatisticsList(VisitStatisticsSearchVO statistics, Model model) {
			model.addAttribute("visitStatisticsList", visitStatisticsService.getVisitStatisticsList(statistics));
			return "visit/visitStatisticsList";
		}

}
