package com.yedam.yde.expressSales;

import java.util.List;
import java.util.Map;

public interface ExpressSalesService {

	// 월별 조회
	public List<Map<String,Object>> selectListMonth(ExpressSalesVO vo);
	
	// 년도별 조회
	public List<Map<String,Object>> selectListYear(ExpressSalesVO vo);
}
