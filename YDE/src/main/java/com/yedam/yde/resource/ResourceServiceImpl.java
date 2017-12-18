package com.yedam.yde.resource;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
