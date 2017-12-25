package com.yedam.yde.resource;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.yde.employee.EmployeeVO;
import com.yedam.yde.express.ExpressVO;
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
	

	public List<ResourceVO> selectListByExpress(ExpressVO vo) {
		return mybatis.selectList("ResourceDAO.selectListByExpress",vo);
	}
	
	public List<ResourceVO> selectListByNoExpress(ExpressVO vo) {
		return mybatis.selectList("ResourceDAO.selectListByNoExpress",vo);
	}

	public void insertResourceExpress(Map<String, Object> vo) {
		mybatis.insert("ResourceDAO.insertResourceExpress",vo);
	}

	public void deleteResourceExpress(Integer expressNo) {
		mybatis.delete("ResourceDAO.deleteResourceExpress", expressNo);
	}
}
