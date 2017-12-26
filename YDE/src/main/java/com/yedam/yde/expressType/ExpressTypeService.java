package com.yedam.yde.expressType;

import java.util.List;
import java.util.Map;

public interface ExpressTypeService {

	public List<Map<String,Object>> selectListMonth(Map<String,String> vo);
	
	public List<Map<String,Object>> selectListYear(Map<String,String> vo);
}
