package com.yedam.yde.expressSpace;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.yde.employee.EmployeeVO;

@Controller
@RequestMapping("/expressSpace/")
public class ExpressSpaceController {

	@Autowired
	ExpressSpaceService expressSpaceService;

	// 월별 (ajax)
	@RequestMapping("selectListMonth.do")
	@ResponseBody
	public List<Map<String, Object>> selectListMonth(
			@RequestParam(value = "expressReqDate", defaultValue = "", required = false) String date) {

		Map<String, String> vo = new HashMap<String, String>();
		vo.put("expressReqDate", date);

		return expressSpaceService.selectListMonth(vo);
	}

	// 년도별 (ajax)
	@RequestMapping("selectListYear.do")
	@ResponseBody
	public List<Map<String, Object>> selectListYear(
			@RequestParam(value = "expressReqDate", defaultValue = "", required = false) String date) {

		Map<String, String> vo = new HashMap<String, String>();
		vo.put("expressReqDate", date);

		return expressSpaceService.selectListYear(vo);
	}

	// layout
	@RequestMapping("/selectListYearSpaceAdminPage.do")
	public String selectListMonthAdminPage() {
		System.out.println("[ExpressSpaceController][selectListYearSpaceAdminPage]");
		return "admin_flot/expressSpace";
	}

}
