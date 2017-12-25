package com.yedam.yde.expressState;

import java.util.List;
import java.util.Map;

public interface ExpressStateService {

	public List<Map<String,Object>> selectListDay(Map<String,String> vo);
	
	public List<Map<String,Object>> selectListMonth(Map<String,String> vo);
	
	
}
