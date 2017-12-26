package com.yedam.yde.expressType;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExpressTypeDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	

	public List<Map<String, Object>> selectListMonth(Map<String, String> vo) {
		// TODO Auto-generated method stub
		System.out.println(vo.get("type") + " / " + vo.get("date"));
		System.out.println(mybatis.selectList("ExpressTypeDAO.selectListMonth", vo));
		return mybatis.selectList("ExpressTypeDAO.selectListMonth", vo);
	}
	
	public List<Map<String, Object>> selectListYear(Map<String, String> vo) {
		// TODO Auto-generated method stub
		System.out.println(vo.get("type") + " / " + vo.get("date"));
		System.out.println(mybatis.selectList("ExpressTypeDAO.selectListYear", vo));
		return mybatis.selectList("ExpressTypeDAO.selectListYear", vo);
	}
}
