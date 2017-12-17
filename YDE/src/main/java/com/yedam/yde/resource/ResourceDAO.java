package com.yedam.yde.resource;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.yde.resource.ResourceVO;

@Repository
public class ResourceDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public void insert(ResourceVO vo) {
		mybatis.insert("ResourceDAO.insert", vo);
	}
	
	public void delete(ResourceVO vo) {
		mybatis.delete("ResourceDAO.delete",vo);
	}
	
	public void update(ResourceVO vo) {
		mybatis.update("ResourceDAO.update", vo);
	}

	public ResourceVO selectOne(ResourceVO vo) {
		return mybatis.selectOne("ResourceDAO.selectOne", vo);
	}
	
	public List<ResourceVO> selectList() {
		return mybatis.selectList("ResourceDAO.selectList");
	}
}
