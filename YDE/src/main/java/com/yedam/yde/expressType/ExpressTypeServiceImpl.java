package com.yedam.yde.expressType;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExpressTypeServiceImpl implements ExpressTypeService {

	@Autowired
	ExpressTypeDAO expressStateDAO;
	
	@Override
	public List<Map<String, Object>> selectListMonth(Map<String, String> vo) {
		// TODO Auto-generated method stub
		return 	expressStateDAO.selectListMonth(vo);
	}
	
	@Override
	public List<Map<String, Object>> selectListYear(Map<String, String> vo) {
		// TODO Auto-generated method stub
		return 	expressStateDAO.selectListYear(vo);
	}
}
