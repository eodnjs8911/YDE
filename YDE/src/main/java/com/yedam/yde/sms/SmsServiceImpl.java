package com.yedam.yde.sms;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SmsServiceImpl implements SmsService {

	@Autowired
	private SmsDAO smsDAO;

	@Override
	public void insert(SmsVO vo) {
		smsDAO.insert(vo);
	}

	@Override
	public void update(SmsVO vo) {
		smsDAO.update(vo);
	}

	@Override
	public void delete(SmsVO vo) {
		smsDAO.delete(vo);
	}

	@Override
	public SmsVO selectOne(SmsVO vo) {
		return smsDAO.selectOne(vo);
	}

	@Override
	public List<SmsVO> selectList() {
		return smsDAO.selectList();
	}

	@Override
	public List<SmsVO> selectListForAndroid() {
		return smsDAO.selectListForAndroid();
	}
}
