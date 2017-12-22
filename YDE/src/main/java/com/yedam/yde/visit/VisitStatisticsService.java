package com.yedam.yde.visit;

import java.util.List;
import java.util.Map;

public interface VisitStatisticsService {

	// 등록
	public boolean insertVisitStatistics(VisitStatisticsVO statistics);

	// 수정
	//public int updateVisitStatistics(VisitStatisticsVO statistics);

	// 삭제
	//public int deleteVisitStatistics(VisitStatisticsVO statistics);

	// 단건조회
	//public VisitStatisticsSearchVO getVisitStatistics(VisitStatisticsVO statistics);

	// 전체조회
	//public List<Map<String,Object>> getVisitStatisticsList(VisitStatisticsSearchVO statistics);

	//searchVO ? VO ?
	//ip당 누적 방문횟수
	public List<Map<String,Object>> selectIp(VisitStatisticsSearchVO statistics);
	//년도별 방문자 (전체)
	public List<Map<String,Object>> selectListYear(VisitStatisticsSearchVO statistics);
	//달별 방문자 (1년)
	public List<Map<String,Object>> selectListMonth(VisitStatisticsSearchVO statistics);
	//일별 방문자 (1달)
	public List<Map<String,Object>> selectListDay(VisitStatisticsSearchVO statistics);
	
	//오늘 방문자
	public int TodayCount();

	//총 방문자수 
	public int TotalCount();
	
	
}
