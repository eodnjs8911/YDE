package com.yedam.yde.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {
    
	@Autowired
    private NoticeDAO noticeDAO; 
	
	@Override
	public void insert(NoticeVO vo) {
		// TODO Auto-generated method stub
		noticeDAO.insert(vo);
	}

	@Override
	public void delete(NoticeVO vo) {
		// TODO Auto-generated method stub
		noticeDAO.delete(vo);
	}

	@Override
	public void update(NoticeVO vo) {
		// TODO Auto-generated method stub
		noticeDAO.update(vo);
	}

	@Override
	public NoticeVO selectOne(NoticeVO vo) {
		// TODO Auto-generated method stub
		return noticeDAO.selectOne(vo);
	}

	@Override
	public List<NoticeVO> selectList() {
		// TODO Auto-generated method stub
		return noticeDAO.selectList(); 
	}

}
