package com.yedam.yde.expressSpace;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExpressSpaceDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	

	public List<Map<String, Object>> selectListMonth(Map<String, String> vo) {
		// TODO Auto-generated method stub
		System.out.println(vo.get("expressDepartureSize") + " / " + vo.get("expressReqDate"));
		System.out.println(mybatis.selectList("ExpressSpaceDAO.selectListMonth", vo));
		return mybatis.selectList("ExpressSpaceDAO.selectListMonth", vo);
	}
	
	public List<Map<String, Object>> selectListYear(Map<String, String> vo) {
		// TODO Auto-generated method stub
		System.out.println(vo.get("expressDepartureSize") + " / " + vo.get("expressReqDate"));
		System.out.println(mybatis.selectList("ExpressSpaceDAO.selectListYear", vo));
		return mybatis.selectList("ExpressSpaceDAO.selectListYear", vo);
	}
}
