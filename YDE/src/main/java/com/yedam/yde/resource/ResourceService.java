package com.yedam.yde.resource;

import java.util.List;

import com.yedam.yde.resource.ResourceVO;

public interface ResourceService {
	public void insert(ResourceVO vo);
	public void update(ResourceVO vo);
	public void delete(ResourceVO vo);
	public ResourceVO selectOne(ResourceVO vo);
	public List<ResourceVO> selectList();
}
