package com.yedam.yde.sms;

import java.util.List;

public interface SmsService {
	
	public void insert(SmsVO vo);
	public void update(SmsVO vo);
	public void delete(SmsVO vo);
	public SmsVO selectOne(SmsVO vo);
	public List<SmsVO> selectList();
}
