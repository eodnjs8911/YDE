package com.yedam.yde.claim;

import java.util.List;

public interface ClaimService {

	//등록
	public void insert(ClaimVO claimVO);
	//수정
	public void update(ClaimVO claimVO);
	//삭제
	public void delete(ClaimVO claimVO);
	//단건조회
	public ClaimVO selectOne(ClaimVO claimVO);
	//전체조회
	public List<ClaimVO> selectList(ClaimSearchVO csvo);
}
