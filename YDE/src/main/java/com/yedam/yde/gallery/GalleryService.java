package com.yedam.yde.gallery;

import java.util.List;

import com.yedam.yde.gallery.GalleryVO;

public interface GalleryService {
	public void insert(GalleryVO vo);
	public void update(GalleryVO vo);
	public void delete(GalleryVO vo);
	public GalleryVO selectOne(GalleryVO vo);
	public List<GalleryVO> selectList();
}
