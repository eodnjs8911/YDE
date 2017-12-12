package com.yedam.yde.express;

import java.util.List;

public interface ExpressService {
	
	public void insert(ExpressVO vo);
	public void update(ExpressVO vo);
	public void delete(ExpressVO vo);
	public ExpressVO selectOne(ExpressVO vo);
	public List<ExpressVO> selectList();
	public int calcEstimateAmount(ExpressVO vo);
	public int consultReg(ExpressVO vo);
}
