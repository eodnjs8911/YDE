package com.yedam.yde.expressState;

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
@RequestMapping("/expressState/")
public class ExpressStateController {

	@Autowired
	ExpressStateService expressStateService;

	// 일별 (ajax)
	@RequestMapping("selectListDay.do")
	@ResponseBody
	public List<Map<String,Object>> selectListDay(@RequestParam(value="date",defaultValue="",required=false)String date) {
		
		Map<String, String> vo = new HashMap<String, String>();
		vo.put("date", date);

		
		return expressStateService.selectListDay(vo);
	}

}
