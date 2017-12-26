package com.yedam.yde.expressSpace;

import java.util.List;
import java.util.Map;

public interface ExpressSpaceService {

	public List<Map<String,Object>> selectListMonth(Map<String,String> vo);
	
	public List<Map<String,Object>> selectListYear(Map<String,String> vo);
}
