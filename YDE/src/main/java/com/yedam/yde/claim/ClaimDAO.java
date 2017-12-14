package com.yedam.yde.claim;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClaimDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insert(ClaimVO vo) {
		mybatis.insert("ClaimDAO.insert", vo);
	}
	
	public void delete(ClaimVO vo) {
		mybatis.delete("ClaimDAO.delete", vo);
	}

	public void update(ClaimVO vo) {
		mybatis.update("ClaimDAO.update", vo);
	}
	
	public ClaimVO selectOne(ClaimVO vo) {
		return mybatis.selectOne("ClaimDAO.selectOne", vo);
	}
	
	public List<ClaimVO> selectList(ClaimSearchVO csvo) {
		return mybatis.selectList("ClaimDAO.selectList",csvo);
	}
}
