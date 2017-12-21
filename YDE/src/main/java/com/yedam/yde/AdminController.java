package com.yedam.yde;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminController {

	@RequestMapping("/admin/login.do")
	@ResponseBody
	public HashMap<String, String> adminLogin(
			@RequestParam(value = "id", defaultValue = "", required = false) String id,
			@RequestParam(value = "pw", defaultValue = "", required = false) String pw, HttpServletRequest request) {

		HashMap<String, String> result = new HashMap<String, String>();
		if (id.equals("admin") && pw.equals("pw")) {
			request.getSession().setAttribute("login", "login");
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
	}

	@RequestMapping("/admin/logout.do")
	@ResponseBody
	public HashMap<String, String> adminLogout(HttpServletRequest request) {
		HashMap<String, String> result = new HashMap<String, String>();
		request.getSession().setAttribute("login", null);
		result.put("result", "success");
		return result;
	}

	@RequestMapping("/admin/adminPage.do")
	public String adminPage(HttpServletRequest request) {
		return "admin_express/express";
	}

}
