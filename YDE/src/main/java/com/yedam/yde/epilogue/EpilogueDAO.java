package com.yedam.yde.epilogue;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class EpilogueDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insert(EpilogueVO vo) {
		mybatis.insert("EpilogueDAO.insert", vo);
	}
	
	public void delete(EpilogueVO vo) {
		mybatis.delete("EpilogueDAO.delete", vo);
	}
	
	public void update(EpilogueVO vo) {
		mybatis.update("EpilogueDAO.update", vo);
	}
	
	public EpilogueVO selectOne(EpilogueVO vo) {
		return mybatis.selectOne("EpilogueDAO.selectOne", vo);
	}
	
	public List<EpilogueVO> selectList(EpilogueVO vo) {
		return mybatis.selectList("EpilogueDAO.selectList", vo);
	}

}
