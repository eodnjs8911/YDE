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
	
	//입력
	public int insert(VisitStatisticsVO statistics){
		return mybatis.insert("VisitStatisticsDAO.insert", statistics);
	}
	//한 ip당 누적 방문 횟수
	public List<Map<String,Object>> selectIp(VisitStatisticsSearchVO statistics){
		return mybatis.selectList("VisitStatisticsDAO.selectIp", statistics);
	}
	//년도별 방문자 (전체)
	public List<Map<String,Object>> selectListYear(VisitStatisticsSearchVO statistics){
		return mybatis.selectList("VisitStatisticsDAO.selectListYear", statistics);
	}
	//달별 방문자 (1년)
	public List<Map<String,Object>> selectListMonth(VisitStatisticsSearchVO statistics){
		return mybatis.selectList("VisitStatisticsDAO.selectListMonth", statistics);
	}
	//일별 방문자 (1달)
	public List<Map<String,Object>> selectListDay(VisitStatisticsSearchVO statistics){
		return mybatis.selectList("VisitStatisticsDAO.selectListDay", statistics);
	}
	
	//selectOne 맞나?
	//당일 방문자 수
	public int TodayCount(){
		return mybatis.selectOne("VisitStatisticsDAO.TodayCount");
	}

	//총 방문자수 
	public int TotalCount(){
		return mybatis.selectOne("VisitStatisticsDAO.TotalCount");
	}
	
	
	/*public int insertVisitStatistics(VisitStatisticsVO statistics) {
		return mybatis.insert("VisitStatisticsDAO.insertVisitStatistics", statistics);
	}


	public List<Map<String,Object>> getVisitStatisticsList(VisitStatisticsSearchVO statistics) {
		return mybatis.selectList("VisitStatisticsDAO.getVisitStatisticsList");
	}*/
	
}
