package com.yedam.yde.expressState;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExpressStateServiceImpl implements ExpressStateService {

	@Autowired
	ExpressStateDAO expressStateDAO;
	
	@Override
	public List<Map<String, Object>> selectListDay(Map<String, String> vo) {
		// TODO Auto-generated method stub
		return 	expressStateDAO.selectListDay(vo);
	}
}
