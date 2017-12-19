package com.yedam.yde.employee;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.yde.employee.EmployeeVO;
import com.yedam.yde.express.ExpressVO;

@Repository
public class EmployeeDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insert(EmployeeVO vo) {
		mybatis.insert("EmployeeDAO.insert", vo);
	}
	
	public void delete(EmployeeVO vo) {
		mybatis.delete("EmployeeDAO.delete",vo);
	}
	
	public void update(EmployeeVO vo) {
		mybatis.update("EmployeeDAO.update", vo);
	}

	public EmployeeVO selectOne(EmployeeVO vo) {
		return mybatis.selectOne("EmployeeDAO.selectOne", vo);
	}
	
	public List<EmployeeVO> selectList() {
		return mybatis.selectList("EmployeeDAO.selectList");
	}

	public List<EmployeeVO> selectListByExpress(ExpressVO vo) {
		return mybatis.selectList("EmployeeDAO.selectListByExpress",vo);
	}
	
	public List<EmployeeVO> selectListByNoExpress(ExpressVO vo) {
		return mybatis.selectList("EmployeeDAO.selectListByNoExpress",vo);
	}
}
