package com.yedam.yde.express;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		rhm.put("expressNo", vo.getExpressNo());
		return rhm;
	}

	@RequestMapping("/express/consultReg.do")
	@ResponseBody
	public HashMap<String, String> consultReg(@ModelAttribute("express") ExpressVO vo) {
		System.out.println();
		HashMap<String, String> rhm = new HashMap<String, String>();
		if (expressService.consultReg(vo) == 1) {
			rhm.put("result", "success");
		} else {
			rhm.put("result", "fail");
		}
		return rhm;
	}
	
	@RequestMapping("/express/expressAdminPage.do")
	public String expressAdminPage(ExpressVO vo, SessionStatus sessionStatus, Model model) {
		sessionStatus.isComplete();
		model.addAttribute("express", new ExpressVO());
		return "admin_express/express";
	}
	
	@RequestMapping("/express/expressDetail.do")
	@ResponseBody
	public ExpressVO expressDetail(ExpressVO vo, Model model) {
		System.out.println("[ExpressController][expressDetail]");
		model.addAttribute("express", new ExpressVO());
		ExpressVO evo = expressService.selectOne(vo);
		model.addAttribute("express", evo);
		return evo;
	}
	
	@RequestMapping("/express/expressDetailSave.do")
	@ResponseBody
	public HashMap<String, String> expressDetailSave(@ModelAttribute("express") ExpressVO vo,Model model) {
		System.out.println("[ExpressController][expressDetailSave]");
		System.out.println(vo.toString());
		HashMap<String, String> rhm = new HashMap<String, String>();
		expressService.update(vo);
		rhm.put("result", "success");
		model.addAttribute("express", new ExpressVO());
		return rhm;
	}
	
	@RequestMapping("/express/expressDetailDel.do")
	@ResponseBody
	public HashMap<String, String> expressDetailDel(@ModelAttribute("express") ExpressVO vo,Model model) {
		System.out.println("[ExpressController][expressDetailDel]");
		HashMap<String, String> rhm = new HashMap<String, String>();
		expressService.delete(vo);
		rhm.put("result", "success");
		model.addAttribute("express", new ExpressVO());
		return rhm;
	}
	
	@RequestMapping("/express/expressDetailIns.do")
	@ResponseBody
	public HashMap<String, String> expressDetailIns(ExpressVO vo) {
		System.out.println("[ExpressController][expressDetailIns]");
		System.out.println(vo);
		HashMap<String, String> rhm = new HashMap<String, String>();
		expressService.insert(vo);
		rhm.put("result", "success");
		return rhm;
	}
	
	@RequestMapping("/express/expressDragNDrop.do")
	@ResponseBody
	public HashMap<String, String> expressDragNDrop(ExpressVO vo) {
		System.out.println("[ExpressController][expressDragNDrop]");
		HashMap<String, String> rhm = new HashMap<String, String>();
		ExpressVO e = expressService.selectOne(vo);
		if(e.getExpressState().equals("A03")) {
			e.setExpressVisitTime(vo.getExpressDate());
		}else {
			e.setExpressDate(vo.getExpressDate());
		}

		expressService.update(e);
		rhm.put("result", "success");
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
	
	@RequestMapping("/express/selectCalendarList.do")
	@ResponseBody
	public List<Map<String, Object>> selectCalendarList(Model model) {
		System.out.println("[ExpressController][selectCalendarList]");
		return expressService.selectCalendarList();
	}
}
