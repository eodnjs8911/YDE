package com.yedam.yde.epilogue;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.yde.epilogue.EpilogueVO;

@Controller
public class EpilogueController {
	@Autowired
	EpilogueService epilogueService;

	@RequestMapping("/cs/epilogue/insert.do")
	public void insert(EpilogueVO vo) {
		System.out.println("[epilogueController][insert]");
		epilogueService.insert(vo);
	}

	@RequestMapping("/cs/epilogue/update.do")
	public void update(EpilogueVO vo) {
		System.out.println("[epilogueController][update]");
		epilogueService.update(vo);
	}

	@RequestMapping("/cs/epilogue/delete.do")
	public void delete(EpilogueVO vo) {
		System.out.println("[epilogueController][delete]");
		epilogueService.delete(vo);
	}

	@RequestMapping("/cs/epilogue/selectOne.do")
	@ResponseBody
	public EpilogueVO selectOne(EpilogueVO vo, Model model) {
		System.out.println("[epilogueController][selectOne]");
		return epilogueService.selectOne(vo);
	}

	@RequestMapping("/cs/epilogue/selectList.do")
	@ResponseBody
	public List<EpilogueVO> selectList(Model model) {
		System.out.println("[epilogueController][selectList]");
		return epilogueService.selectList();
	}

	@RequestMapping("/cs/epilogue/edit.do")
	@ResponseBody
	public void edit(@RequestParam(value = "oper", defaultValue = "", required = false) String oper,
			@RequestParam(value = "id", defaultValue = "", required = false) String id, EpilogueVO vo) {
		System.out.println("[epilogueController][edit]");
		System.out.println(vo);
		if (oper.equals("add")) {
			epilogueService.insert(vo);
		} else if (oper.equals("edit")) {
			if (id != null & id.length() > 0) {
				vo.setEpilogueNo(Integer.parseInt(id));
				epilogueService.update(vo);
			}
		} else if (oper.equals("del")) {
			System.out.println(id);
			if (id.length() > 0) {
				for (String i : id.split(",")) {
					vo.setEpilogueNo(Integer.parseInt(i));
					epilogueService.delete(vo);
				}
			}
		}
	}

}
