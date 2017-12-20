package com.yedam.yde.employee;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.yde.express.ExpressVO;

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

	@Override
	public List<EmployeeVO> selectListByExpress(ExpressVO vo) {
		// TODO Auto-generated method stub
		return employeeDAO.selectListByExpress(vo);
	}

	@Override
	public List<EmployeeVO> selectListByNoExpress(ExpressVO vo) {
		// TODO Auto-generated method stub
		return employeeDAO.selectListByNoExpress(vo);
	}

	@Override
	public void insertEmployeeExpress(Map<String, Object> vo) {
		// TODO Auto-generated method stub
		employeeDAO.insertEmployeeExpress(vo);
	}
	
	@Override
	public void deleteEmployeeExpress(Integer expressNo) {
		// TODO Auto-generated method stub
		employeeDAO.deleteEmployeeExpress(expressNo);
	}

}
