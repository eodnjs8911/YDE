package com.yedam.yde.sms;

import java.util.List;

public interface SmsService {
	
	public void insert(SmsVO smsVO);
	public void update(SmsVO smsVO);
	public void delete(SmsVO smsVO);
	public SmsVO selectOne(SmsVO smsVO);
	public List<SmsVO> selectList();
}
