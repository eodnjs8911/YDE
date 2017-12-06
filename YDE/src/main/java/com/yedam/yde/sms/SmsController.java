package com.yedam.yde.sms;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SmsController {
	@Autowired
	SmsService smsService;
	
	@RequestMapping("/sms/selectOne.do")
	public String selectOne(SmsVO vo, Model model) {
		System.out.println("[SmsController][selectOne]");
		model.addAttribute("sms",smsService.selectOne(vo));
		return "sms/selectOne";
	}
	
	@RequestMapping("/sms/selectList.do")
	public String selectList(Model model) {
		System.out.println("[SmsController][selectList]");
		model.addAttribute("smsList",smsService.selectList());
		return "sms/selectList";
	}
}
