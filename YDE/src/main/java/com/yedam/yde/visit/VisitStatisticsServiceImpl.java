package com.yedam.yde.visit;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VisitStatisticsServiceImpl implements VisitStatisticsService {

	@Autowired
	VisitStatisticsDAO visitStatisticsDAO;
	
	@Override
	public boolean insertVisitStatistics(VisitStatisticsVO statistics) {
		int r = visitStatisticsDAO.insertVisitStatistics(statistics);
		if(r>0) {
			return true;
		}
		else return false;
	}
	
	@Override
	public List<Map<String,Object>> getVisitStatisticsList(VisitStatisticsSearchVO statistics) {
		return visitStatisticsDAO.getVisitStatisticsList(statistics);
	}
	
}
