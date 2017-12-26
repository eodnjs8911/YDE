package com.yedam.yde.gallery;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.yde.gallery.GalleryVO;

@Repository
public class GalleryDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insert(GalleryVO vo) {
		mybatis.insert("GalleryDAO.insert", vo);
	}
	
	public void delete(GalleryVO vo) {
		mybatis.delete("GalleryDAO.delete",vo);
	}
	
	public void update(GalleryVO vo) {
		mybatis.update("GalleryDAO.update", vo);
	}

	public GalleryVO selectOne(GalleryVO vo) {
		return mybatis.selectOne("GalleryDAO.selectOne", vo);
	}
	
	public List<GalleryVO> selectList() {
		return mybatis.selectList("GalleryDAO.selectList");
	}
}
