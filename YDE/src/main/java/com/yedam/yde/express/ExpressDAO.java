package com.yedam.yde.express;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExpressDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void insert(ExpressVO vo) {
		mybatis.insert("ExpressDAO.insert", vo);
	}
	
	public void delete(ExpressVO vo) {
		mybatis.delete("ExpressDAO.delete",vo);
	}
	
	public void update(ExpressVO vo) {
		mybatis.update("ExpressDAO.update", vo);
	}

	public ExpressVO selectOne(ExpressVO vo) {
		return mybatis.selectOne("ExpressDAO.selectOne", vo);
	}
	
	public Integer selectCount(ExpressVO vo) {
		return mybatis.selectOne("ExpressDAO.selectCount", vo);
	}
	
	public List<ExpressVO> selectList() {
		return mybatis.selectList("ExpressDAO.selectList");
	}

	public List<Map<String, Object>>selectCalendarList() {
		return mybatis.selectList("ExpressDAO.selectCalendarList");
	}

	public void sendSmsInfo() {
		mybatis.selectList("ExpressDAO.sendSmsInfo");
	}

	public List<ExpressVO> selectListToday(String state) {
		if(state.equals("A01")) {
			return mybatis.selectList("ExpressDAO.selectListTodayA01");
		}else if(state.equals("A02")) {
			return mybatis.selectList("ExpressDAO.selectListTodayA02");
		}else if(state.equals("A03")) {
			return mybatis.selectList("ExpressDAO.selectListTodayA03");
		}else if(state.equals("A05")) {
			return mybatis.selectList("ExpressDAO.selectListTodayA05");
		}else {
			return null;
		}
	}
}
