package com.yedam.yde.claim;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ClaimController {

	@Autowired
	ClaimService claimService;
	
	@RequestMapping("/claim/selectOne.do")
	public String selectOne(ClaimVO vo, Model model) {
		System.out.println("[ClaimController][selectOne]");
		model.addAttribute("claim", claimService.selectOne(vo));
		
		return "claim/selectOne";
	}
	
	@RequestMapping("/claim/selectList.do")
	public String selectList(Model model) {
		System.out.println("[ClaimController][selectList]");
		model.addAttribute("claimList", claimService.selectList());
		
		return "claim/selectList";
	}
}
