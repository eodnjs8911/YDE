package com.yedam.yde.resource;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.yde.employee.EmployeeVO;
import com.yedam.yde.express.ExpressVO;

@Service
public class ResourceServiceImpl implements ResourceService {
	
	@Autowired 
	ResourceDAO resourceDAO;
	@Override
	public void insert(ResourceVO vo) {
		// TODO Auto-generated method stub
		resourceDAO.insert(vo);
	}

	@Override
	public void update(ResourceVO vo) {
		// TODO Auto-generated method stub
		resourceDAO.update(vo);
	}

	@Override
	public void delete(ResourceVO vo) {
		// TODO Auto-generated method stub
		resourceDAO.delete(vo);
	}

	@Override
	public ResourceVO selectOne(ResourceVO vo) {
		// TODO Auto-generated method stub
		return resourceDAO.selectOne(vo);
	}

	@Override
	public List<ResourceVO> selectList() {
		// TODO Auto-generated method stub
		return resourceDAO.selectList();
	}

	@Override
	public List<ResourceVO> selectListByExpress(ExpressVO vo) {
		// TODO Auto-generated method stub
		return resourceDAO.selectListByExpress(vo);
	}

	@Override
	public List<ResourceVO> selectListByNoExpress(ExpressVO vo) {
		// TODO Auto-generated method stub
		return resourceDAO.selectListByNoExpress(vo);
	}

	@Override
	public void insertResourceExpress(Map<String, Object> vo) {
		// TODO Auto-generated method stub
		resourceDAO.insertResourceExpress(vo);
	}
	
	@Override
	public void deleteResourceExpress(Integer expressNo) {
		// TODO Auto-generated method stub
		resourceDAO.deleteResourceExpress(expressNo);
	}

}
