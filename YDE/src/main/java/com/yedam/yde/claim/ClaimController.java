package com.yedam.yde.claim;

import java.util.List;

import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.yde.sms.SmsVO;

@Controller

public class ClaimController {

	@Autowired
	ClaimService claimService;
	
	//등록폼
	@RequestMapping(value="/claim/insert.do", method=RequestMethod.GET)
	public String insertForm(ClaimVO vo) {
		return "claim/insert";
	}
	
	//등록
		@RequestMapping(value="/claim/insert.do", method=RequestMethod.POST)
		public String insert(ClaimVO vo) {
			claimService.insert(vo);
			return "forward:insert.do";
		}
	
	//단건조회
	@RequestMapping("/claim/selectOne.do")
	public String selectOne(ClaimVO vo, Model model) {
		System.out.println("[ClaimController][selectOne]");
		model.addAttribute("claim", claimService.selectOne(vo));
		
		return "claim/selectOne";
	}
	
	//전체조회
	@RequestMapping("/claim/selectList.do")
	public String selectList(Model model) {
		System.out.println("[ClaimController][selectList]");
		model.addAttribute("claimList", claimService.selectList());
		
		return "claim/selectList";
	}
	
	@RequestMapping("/claim/selectList2.do")
	@ResponseBody
	public List<ClaimVO> claim(Model model) {
		System.out.println("[claimController][selectList2]");
		return claimService.selectList();
	}
}
