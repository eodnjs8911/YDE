package com.yedam.yde.gallery;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GalleryServiceImpl implements GalleryService {
	
	@Autowired
	GalleryDAO galleryDAO;
	@Override
	public void insert(GalleryVO vo) {
		// TODO Auto-generated method stub
		galleryDAO.insert(vo);
	}

	@Override
	public void update(GalleryVO vo) {
		// TODO Auto-generated method stub
		galleryDAO.update(vo);

	}

	@Override
	public void delete(GalleryVO vo) {
		// TODO Auto-generated method stub
		galleryDAO.delete(vo);
	}

	@Override
	public GalleryVO selectOne(GalleryVO vo) {
		// TODO Auto-generated method stub
		return galleryDAO.selectOne(vo);
	}

	@Override
	public List<GalleryVO> selectList() {
		// TODO Auto-generated method stub
		return galleryDAO.selectList();
	}

}
