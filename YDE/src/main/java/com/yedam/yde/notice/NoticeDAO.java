package com.yedam.yde.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insert(NoticeVO vo) {
		mybatis.insert("NoticeDAO.insertNotice", vo);
	}
	
	public void delete(NoticeVO vo) {
		mybatis.delete("NoticeDAO.deleteNotice", vo);
	}
	
	public void update(NoticeVO vo) {
		mybatis.update("NoticeDAO.updateNotice", vo);
	}
	
	public NoticeVO selectOne(NoticeVO vo) {
		return mybatis.selectOne("NoticeDAO.selectOne", vo);
	}
	
	public List<NoticeVO> selectList(NoticeVO vo) {
		return mybatis.selectList("NoticeDAO.selectList", vo);
	}

}