package com.yedam.yde.employee;

import java.util.List;

import com.yedam.yde.employee.EmployeeVO;

public interface EmployeeService {
	
	public void insert(EmployeeVO vo);
	public void update(EmployeeVO vo);
	public void delete(EmployeeVO vo);
	public EmployeeVO selectOne(EmployeeVO vo);
	public List<EmployeeVO> selectList();
}
