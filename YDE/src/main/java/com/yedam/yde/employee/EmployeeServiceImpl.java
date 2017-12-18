package com.yedam.yde.employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	EmployeeDAO employeeDAO;
	
	@Override
	public void insert(EmployeeVO vo) {
		// TODO Auto-generated method stub
		employeeDAO.insert(vo);
	}

	@Override
	public void update(EmployeeVO vo) {
		// TODO Auto-generated method stub
		employeeDAO.update(vo);
	}

	@Override
	public void delete(EmployeeVO vo) {
		// TODO Auto-generated method stub
		employeeDAO.delete(vo);
	}

	@Override
	public EmployeeVO selectOne(EmployeeVO vo) {
		// TODO Auto-generated method stub
		return employeeDAO.selectOne(vo);
	}

	@Override
	public List<EmployeeVO> selectList() {
		// TODO Auto-generated method stub
		return 	employeeDAO.selectList();
	}

}
