package com.yedam.yde.expressSpace;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExpressSpaceServiceImpl implements ExpressSpaceService {

	@Autowired
	ExpressSpaceDAO expressSpaceDAO;
	
	@Override
	public List<Map<String, Object>> selectListMonth(Map<String, String> vo) {
		// TODO Auto-generated method stub
		return 	expressSpaceDAO.selectListMonth(vo);
	}
	
	@Override
	public List<Map<String, Object>> selectListYear(Map<String, String> vo) {
		// TODO Auto-generated method stub
		return 	expressSpaceDAO.selectListYear(vo);
	}
}
