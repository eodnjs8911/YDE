package com.yedam.yde.resource;

import java.util.List;
import java.util.Map;

import com.yedam.yde.employee.EmployeeVO;
import com.yedam.yde.express.ExpressVO;
import com.yedam.yde.resource.ResourceVO;

public interface ResourceService {
	public void insert(ResourceVO vo);
	public void update(ResourceVO vo);
	public void delete(ResourceVO vo);
	public ResourceVO selectOne(ResourceVO vo);
	public List<ResourceVO> selectList();
	public List<ResourceVO> selectListByExpress(ExpressVO vo);
	public List<ResourceVO> selectListByNoExpress(ExpressVO vo);
	public void insertResourceExpress(Map<String,Object> vo);
	public void deleteResourceExpress(Integer expressNo);
}
