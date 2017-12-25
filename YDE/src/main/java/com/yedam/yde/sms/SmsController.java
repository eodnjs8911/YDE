package com.yedam.yde.sms;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SmsController {
	@Autowired
	SmsService smsService;
	
	@RequestMapping("/sms/smsAdminPage.do")
	public String smsAdminPage(SmsVO vo) {
		System.out.println("[SmsController][smsAdminPage]");
		return "admin_sms/sms";
	}

	@RequestMapping("/sms/insert.do")
	public void insert(SmsVO vo) {
		System.out.println("[SmsController][insert]");
		System.out.println(vo.getSmsState());
		if(vo.getSmsState() == null || vo.getSmsState().length() == 0) {
			vo.setSmsState("D01");
		}
		smsService.insert(vo);
	}

	@RequestMapping("/sms/update.do")
	public void update(SmsVO vo) {
		System.out.println("[SmsController][update]");
		smsService.update(vo);
	}

	@RequestMapping("/sms/delete.do")
	public void delete(SmsVO vo) {
		System.out.println("[SmsController][delete]");
		smsService.delete(vo);
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
	
	@RequestMapping("/sms/selectListForAndroid.do")
	@ResponseBody
	public List<SmsVO> selectListForAndroid(Model model) {
		System.out.println("[SmsController][selectListForAndroid]");
		return smsService.selectListForAndroid();
	}
	
	@RequestMapping("/sms/updateForAndroid.do")
	@ResponseBody
	public void updateForAndroid(SmsVO vo, Model model) {
		System.out.println("[SmsController][updateForAndroid]");
		SmsVO sVO = smsService.selectOne(vo);
		sVO.setSmsSDate(vo.getSmsSDate());
		sVO.setSmsState(vo.getSmsState());
		smsService.update(sVO);
	}
	
	@RequestMapping("/sms/edit.do")
	@ResponseBody
	public void edit(@RequestParam(value="oper",defaultValue="",required=false)String oper,
			@RequestParam(value="id",defaultValue="",required=false)String id,SmsVO vo) {
		System.out.println("[SmsController][edit]");
		System.out.println(vo);
		if(oper.equals("add")) {
			smsService.insert(vo);
		}else if(oper.equals("edit")) {
			smsService.update(vo);
		}else if(oper.equals("del")) {
			System.out.println(id);
			if(id.length()>0) {
				for(String i : id.split(",")) {
					vo.setSmsNo(Integer.parseInt(i));
					smsService.delete(vo);
				}
			}
		}
	}
}
