package com.yedam.yde.claim;

import java.util.List;

public interface ClaimService {

	public void insert(ClaimVO claimVO);
	public void update(ClaimVO claimVO);
	public void delete(ClaimVO claimVO);
	public ClaimVO selectOne(ClaimVO claimVO);
	public List<ClaimVO> selectList();
}
