package com.yedam.yde.visit;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VisitStatisticsDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertVisitStatistics(VisitStatisticsVO statistics) {
		return mybatis.insert("VisitStatisticsDAO.insertVisitStatistics", statistics);
	}


	public List<Map<String,Object>> getVisitStatisticsList(VisitStatisticsSearchVO statistics) {
		return mybatis.selectList("VisitStatisticsDAO.getVisitStatisticsList");
	}
	
}
