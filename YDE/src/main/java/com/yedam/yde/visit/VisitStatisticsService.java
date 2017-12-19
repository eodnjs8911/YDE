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
	public List<Map<String,Object>> getVisitStatisticsList(VisitStatisticsSearchVO statistics);

}
