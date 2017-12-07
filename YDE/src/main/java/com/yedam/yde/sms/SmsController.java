package com.yedam.yde.sms;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SmsController {
	@Autowired
	SmsService smsService;

	@RequestMapping("/sms/insert.do")
	public void insert(SmsVO vo) {
		System.out.println("[SmsController][insert]");
	}

	@RequestMapping("/sms/update.do")
	public void update(SmsVO vo) {
		System.out.println("[SmsController][update]");
	}

	@RequestMapping("/sms/delete.do")
	public void delete(SmsVO vo) {
		System.out.println("[SmsController][delete]");
	}

	@RequestMapping("/sms/selectOne.do")
	@ResponseBody
	public SmsVO selectOne(SmsVO vo, Model model) {
		System.out.println("[SmsController][selectOne]");
		return smsService.selectOne(vo);
	}

	@RequestMapping("/sms/selectList.do")
	@ResponseBody
	public List<SmsVO> selectList(Model model) {
		System.out.println("[SmsController][selectList]");
		return smsService.selectList();
	}
}
