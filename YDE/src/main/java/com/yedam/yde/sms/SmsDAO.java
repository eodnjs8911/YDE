package com.yedam.yde.sms;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SmsDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void insert(SmsVO vo) {
		mybatis.insert("SmsDAO.insert", vo);
	}
	
	public void delete(SmsVO vo) {
		mybatis.delete("SmsDAO.delete",vo);
	}
	
	public void update(SmsVO vo) {
		mybatis.update("SmsDAO.update", vo);
	}

	public SmsVO selectOne(SmsVO vo) {
		return mybatis.selectOne("SmsDAO.selectOne", vo);
	}
	
	public List<SmsVO> selectList() {
		return mybatis.selectList("SmsDAO.selectList");
	}

	public List<SmsVO> selectListForAndroid() {
		return mybatis.selectList("SmsDAO.selectListForAndroid");
	}
}
