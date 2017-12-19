package com.yedam.yde.employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.yde.employee.EmployeeService;
import com.yedam.yde.employee.EmployeeVO;
import com.yedam.yde.employee.EmployeeService;
import com.yedam.yde.employee.EmployeeVO;

@Controller
public class EmployeeController {

	@Autowired
	EmployeeService employeeService;
	
	@RequestMapping("/employee/employeeAdminPage.do")
	public String employeeAdminPage(EmployeeVO vo) {
		System.out.println("[EmployeeController][employeeAdminPage]");
		return "admin_employee/employee";
	}

	@RequestMapping("/employee/insert.do")
	public void insert(EmployeeVO vo) {
		System.out.println("[EmployeeController][insert]");
		employeeService.insert(vo);
	}

	@RequestMapping("/employee/update.do")
	public void update(EmployeeVO vo) {
		System.out.println("[EmployeeController][update]");
		employeeService.update(vo);
	}

	@RequestMapping("/employee/delete.do")
	public void delete(EmployeeVO vo) {
		System.out.println("[EmployeeController][delete]");
		employeeService.delete(vo);
	}

	@RequestMapping("/employee/selectOne.do")
	@ResponseBody
	public EmployeeVO selectOne(EmployeeVO vo, Model model) {
		System.out.println("[EmployeeController][selectOne]");
		return employeeService.selectOne(vo);
	}

	@RequestMapping("/employee/selectList.do")
	@ResponseBody
	public List<EmployeeVO> selectList(Model model) {
		System.out.println("[EmployeeController][selectList]");
		return employeeService.selectList();
	}
	
	@RequestMapping("/employee/edit.do")
	@ResponseBody
	public void edit(@RequestParam(value="oper",defaultValue="",required=false)String oper,
			@RequestParam(value="id",defaultValue="",required=false)String id, EmployeeVO vo) {
		System.out.println("[EmployeeController][edit]");
		System.out.println(vo);
		if(oper.equals("add")) {
			employeeService.insert(vo);
		}else if(oper.equals("edit")) {
			employeeService.update(vo);
		}else if(oper.equals("del")) {
			System.out.println(id);
			if(id.length()>0) {
				for(String i : id.split(",")) {
					vo.setEmployeeNo(Integer.parseInt(i));
					employeeService.delete(vo);
				}
			}
		}
	}
}
