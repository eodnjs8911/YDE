package com.yedam.yde.expressSales;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExpressSalesDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//월별 매출 (1년)
	public List<Map<String,Object>> selectListMonth(ExpressSalesVO vo){
		return mybatis.selectList("ExpressSalesDAO.selectListMonth", vo);
	}

	//년도별 매출 (전체)
	public List<Map<String,Object>> selectListYear(ExpressSalesVO vo){
		return mybatis.selectList("ExpressSalesDAO.selectListYear", vo);
	}
}
