package com.yedam.yde.epilogue;

import java.util.List;

import com.yedam.yde.notice.NoticeVO;

public interface EpilogueService {
	public void insert(EpilogueVO vo); 
	public void delete(EpilogueVO vo); 
	public void update(EpilogueVO vo);
	public EpilogueVO selectOne(EpilogueVO vo); 
	public List<EpilogueVO> selectList(EpilogueVO vo);
}
