package com.yedam.yde.claim;

import java.util.List;

import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.yde.sms.SmsVO;

@Controller
public class ClaimController {

	@Autowired
	ClaimService claimService;

	@RequestMapping("/claim/claimAdminPage.do")
	public String ClaimAdminPage(ClaimVO vo) {
		System.out.println("[ClaimController][claimAdminPage]");
		return "admin_claim/claim";
	}

	// 등록폼
	@RequestMapping(value = "/cs/insert.do", method = RequestMethod.GET)
	public String insertForm(ClaimVO vo) {
		return "cs/insert";
	}

	// 등록
/*	@RequestMapping(value = "/cs/insert.do", method = RequestMethod.POST)
	public String insert(ClaimVO vo) {
		claimService.insert(vo);
		return "redirect:/cs/insert.do";
	}*/

	// 등록 팝업 테스트
	@RequestMapping(value = "/cs/insert.do", method = RequestMethod.POST)
	@ResponseBody
	public String insert(ClaimVO vo) {
		response.getWriter().append("<script>alert('"+"입력이 완료되었습니다.');").append("document.location.href='/yde/cs/insert.do';</script>");
		
		
		
		claimService.insert(vo);
		return "redirect:/cs/insert.do";
	}

	// 수정
	@RequestMapping("/Claim/update.do")
	public void update(ClaimVO vo) {
		System.out.println("[ClaimController][update]");
		claimService.update(vo);
	}

	// 삭제
	@RequestMapping("/Claim/delete.do")
	public void delete(ClaimVO vo) {
		System.out.println("[ClaimController][delete]");
		claimService.delete(vo);
	}

	// 단건조회
	@RequestMapping("/claim/selectOne.do")
	public String selectOne(ClaimVO vo, Model model) {
		System.out.println("[ClaimController][selectOne]");
		model.addAttribute("claim", claimService.selectOne(vo));

		return "claim/selectOne";
	}

	// 전체조회
	@RequestMapping("/claim/selectList.do")
	public String selectList(Model model, ClaimSearchVO csvo) {
		System.out.println("[ClaimController][selectList]");
		model.addAttribute("claimList", claimService.selectList(csvo));

		return "claim/selectList";
	}

	// 전체조회
	@RequestMapping("/claim/selectList2.do")
	@ResponseBody
	public List<ClaimVO> claim(ClaimSearchVO csvo, Model model) {
		System.out.println("[claimController][selectList2]" + csvo);
		return claimService.selectList(csvo);
	}

	@RequestMapping("/claim/edit.do")
	@ResponseBody
	public void edit(@RequestParam(value = "oper", defaultValue = "", required = false) String oper, ClaimVO claimVO) {
		System.out.println("[CalimController][edit]");
		System.out.println(claimVO);
		if (oper.equals("add")) {
			claimService.insert(claimVO);
		} else if (oper.equals("edit")) {
			claimService.update(claimVO);
		} else if (oper.equals("del")) {
			claimService.delete(claimVO);
		}
	}

}
