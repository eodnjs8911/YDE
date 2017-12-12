package com.yedam.yde.express;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@SessionAttributes("express")
public class ExpressController {
	@Autowired
	ExpressService expressService;

	@RequestMapping("/express/calcPage.do")
	public String calcPage(ExpressVO vo, SessionStatus sessionStatus, Model model) {
		sessionStatus.isComplete();
		model.addAttribute("express", new ExpressVO());
		return "express/calcPage";
	}

	@RequestMapping("/express/priceCalc.do")
	@ResponseBody
	public HashMap<String, Integer> priceCalc(ExpressVO vo, Model model) {
		System.out.println("[ExpressController][insert]");

		int estimateAmount = expressService.calcEstimateAmount(vo);
		vo.setExpressEstimateAmount(estimateAmount);
		expressService.insert(vo);
		model.addAttribute("express", vo);

		HashMap<String, Integer> rhm = new HashMap<String, Integer>();
		rhm.put("price", estimateAmount);
		rhm.put("price", 10000);
		rhm.put("expressNo", vo.getExpressNo());
		return rhm;
	}

	@RequestMapping("/express/consultReg.do")
	@ResponseBody
	public HashMap<String, String> consultReg(@ModelAttribute("express") ExpressVO vo) {
		HashMap<String, String> rhm = new HashMap<String, String>();
		if (expressService.consultReg(vo) == 1) {
			rhm.put("result", "success");
		} else {
			rhm.put("result", "fail");
		}
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
		return expressService.selectOne(vo);
	}

	@RequestMapping("/express/selectList.do")
	@ResponseBody
	public List<ExpressVO> selectList(Model model) {
		System.out.println("[ExpressController][selectList]");
		return expressService.selectList();
	}
}
