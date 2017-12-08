package com.yedam.yde.express;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ExpressController {
	@Autowired
	ExpressService smsService;
	
	@RequestMapping("/express/calcPage.do")
	public String calcPage(ExpressVO vo) {
		return "express/calcPage";
	}

	@RequestMapping("/express/priceCalc.do")
	@ResponseBody
	public HashMap<String, Integer> priceCalc(ExpressVO vo) {
		System.out.println("[ExpressController][insert]");
		System.out.println(vo.toString());
		smsService.insert(vo);
		HashMap<String, Integer> rhm = new HashMap<String, Integer>();
		rhm.put("price", 10000);
		rhm.put("expressNo", vo.getExpressNo());
		return rhm;
	}
	
	@RequestMapping("/express/insert.do")
	public void insert(ExpressVO vo) {
		System.out.println("[ExpressController][insert]");
	}

	@RequestMapping("/express/update.do")
	public void update(ExpressVO vo) {
		System.out.println("[ExpressController][update]");
	}

	@RequestMapping("/express/delete.do")
	public void delete(ExpressVO vo) {
		System.out.println("[ExpressController][delete]");
	}

	@RequestMapping("/express/selectOne.do")
	@ResponseBody
	public ExpressVO selectOne(ExpressVO vo, Model model) {
		System.out.println("[ExpressController][selectOne]");
		return smsService.selectOne(vo);
	}

	@RequestMapping("/express/selectList.do")
	@ResponseBody
	public List<ExpressVO> selectList(Model model) {
		System.out.println("[ExpressController][selectList]");
		return smsService.selectList();
	}
}
