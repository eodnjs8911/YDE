package com.yedam.yde.gallery;

import org.springframework.web.multipart.MultipartFile;

public class GalleryVO {
	int galleryNo;
	String galleryContent;
	String galleryWDate;
	String galleryTitle;
	MultipartFile galaryImage;
	
	public MultipartFile getGalaryImage() {
		return galaryImage;
	}
	public void setGalaryImage(MultipartFile galaryImage) {
		this.galaryImage = galaryImage;
	}
	public int getGalleryNo() {
		return galleryNo;
	}
	public void setGalleryNo(int galleryNo) {
		this.galleryNo = galleryNo;
	}
	public String getGalleryTitle() {
		return galleryTitle;
	}
	public void setGalleryTitle(String galleryTitle) {
		this.galleryTitle = galleryTitle;
	}
	public String getGalleryContent() {
		return galleryContent;
	}
	public void setGalleryContent(String galleryContent) {
		this.galleryContent = galleryContent;
	}
	public String getGalleryWDate() {
		return galleryWDate;
	}
	public void setGalleryWDate(String galleryWDate) {
		this.galleryWDate = galleryWDate;
	}
}
