package com.yedam.yde.expressSales;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExpressSalesServiceImpl implements ExpressSalesService {

	@Autowired
	ExpressSalesDAO expressSalesDAO;
	
	//월별 매출(1년)
	@Override
	public List<Map<String,Object>> selectListMonth(ExpressSalesVO vo){
		return expressSalesDAO.selectListMonth(vo);
	}
	
	//년도별 매출 
		@Override
		public List<Map<String,Object>> selectListYear(ExpressSalesVO vo){
			return expressSalesDAO.selectListYear(vo);
		}
}
