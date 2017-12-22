package com.yedam.yde.visit;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VisitStatisticsServiceImpl implements VisitStatisticsService {

	@Autowired
	VisitStatisticsDAO visitStatisticsDAO;
	
	//입력
	@Override
	public boolean insertVisitStatistics(VisitStatisticsVO statistics) {
		
		Integer check = visitStatisticsDAO.CheckTodayIp(statistics);
		System.out.println("============ 당일 ip중복 check값(VisitStatisticsServiceImpl) null:입력,1:입력X =============== : "+ check);
		if( check == null) {			
		
			int r = visitStatisticsDAO.insert(statistics);
			if(r>0) {
				return true;
			}
		}
		return false;
	}
	//ip당 누적 방문횟수
	@Override
	public List<Map<String,Object>> selectIp(VisitStatisticsSearchVO statistics){
		return visitStatisticsDAO.selectIp(statistics);
	}
	//년도별 방문자 (전체)
	@Override
	public List<Map<String,Object>> selectListYear(VisitStatisticsSearchVO statistics){
		return visitStatisticsDAO.selectListYear(statistics);
	}
	//달별 방문자 (1년)
	@Override
	public List<Map<String,Object>> selectListMonth(VisitStatisticsSearchVO statistics){
		return visitStatisticsDAO.selectListMonth(statistics);
	}
	//일별 방문자 (1달)
	@Override
	public List<Map<String,Object>> selectListDay(VisitStatisticsSearchVO statistics){
		return visitStatisticsDAO.selectListDay(statistics);
	}

	@Override
	public int TodayCount() {
		// TODO Auto-generated method stub
		return visitStatisticsDAO.TodayCount();
	}

	@Override
	public int TotalCount() {
		// TODO Auto-generated method stub
		return visitStatisticsDAO.TotalCount();
	}
	
}
