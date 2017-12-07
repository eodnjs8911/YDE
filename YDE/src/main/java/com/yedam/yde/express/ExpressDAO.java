package com.yedam.yde.express;

import java.util.ArrayList;
import java.util.List;

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
	
	public List<ExpressVO> selectList() {
		return mybatis.selectList("ExpressDAO.selectList");
	}
}
