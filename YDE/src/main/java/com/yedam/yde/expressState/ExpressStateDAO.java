package com.yedam.yde.expressState;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExpressStateDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<Map<String, Object>> selectListDay(Map<String, String> vo) {
		// TODO Auto-generated method stub
		System.out.println(vo.get("state") + " / " + vo.get("date"));
		System.out.println(mybatis.selectList("VisitStatisticsDAO.selectListDay", vo));
		return mybatis.selectList("ExpressStateDAO.selectListDay", vo);
	}
	
	public List<Map<String, Object>> selectListMonth(Map<String, String> vo) {
		// TODO Auto-generated method stub
		System.out.println(vo.get("state") + " / " + vo.get("date"));
		System.out.println(mybatis.selectList("VisitStatisticsDAO.selectListMonth", vo));
		return mybatis.selectList("ExpressStateDAO.selectListMonth", vo);
	}
	
}
