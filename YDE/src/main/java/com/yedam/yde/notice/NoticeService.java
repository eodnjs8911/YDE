package com.yedam.yde.notice;

import java.util.List;

public interface NoticeService {
	public void insert(NoticeVO vo); 
	public void delete(NoticeVO vo); 
	public void update(NoticeVO vo);
	public NoticeVO selectOne(NoticeVO vo); 
	public List<NoticeVO> selectList(NoticeVO vo);
}
