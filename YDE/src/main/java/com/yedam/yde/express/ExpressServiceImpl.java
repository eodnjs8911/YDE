package com.yedam.yde.express;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExpressServiceImpl implements ExpressService {

	@Autowired
	private ExpressDAO expressDAO;

	@Override
	public void insert(ExpressVO vo) {
		expressDAO.insert(vo);
	}

	@Override
	public void update(ExpressVO vo) {
		expressDAO.update(vo);
	}

	@Override
	public void delete(ExpressVO vo) {
		expressDAO.delete(vo);
	}

	@Override
	public ExpressVO selectOne(ExpressVO vo) {
		return expressDAO.selectOne(vo);
	}

	@Override
	public List<ExpressVO> selectList() {
		return expressDAO.selectList();
	}
}
