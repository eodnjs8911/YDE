package com.yedam.yde.claim;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClaimServiceImpl implements ClaimService {

	@Autowired
	private ClaimDAO claimDAO;
	
	@Override
	public void insert(ClaimVO vo) {
		claimDAO.insert(vo);
	}
	
	@Override
	public void update(ClaimVO vo) {
		claimDAO.update(vo);
	}
	
	@Override
	public void delete(ClaimVO vo) {
		claimDAO.delete(vo);
	}
	
	@Override
	public ClaimVO selectOne(ClaimVO vo) {
		return claimDAO.selectOne(vo);
	}
	
	@Override
	public List<ClaimVO> selectList(ClaimSearchVO csvo) {
		return claimDAO.selectList(csvo);
	}

	
}
