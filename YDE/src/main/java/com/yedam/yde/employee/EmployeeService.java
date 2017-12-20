package com.yedam.yde.employee;

import java.util.List;
import java.util.Map;

import com.yedam.yde.employee.EmployeeVO;
import com.yedam.yde.express.ExpressVO;

public interface EmployeeService {
	
	public void insert(EmployeeVO vo);
	public void update(EmployeeVO vo);
	public void delete(EmployeeVO vo);
	public EmployeeVO selectOne(EmployeeVO vo);
	public List<EmployeeVO> selectList();
	public List<EmployeeVO> selectListByExpress(ExpressVO vo);
	public List<EmployeeVO> selectListByNoExpress(ExpressVO vo);
	public void insertEmployeeExpress(Map<String,Object> vo);
	public void deleteEmployeeExpress(Integer expressNo);
}
