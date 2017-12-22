package com.yedam.yde.gallery;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.support.MultipartFilter;

import com.yedam.yde.gallery.GalleryService;
import com.yedam.yde.gallery.GalleryVO;
import com.yedam.yde.express.ExpressVO;

@Controller
public class GalleryController {
	
	@Autowired
	GalleryService galleryService;
	
	@RequestMapping("/gallery/galleryAdminPage.do")
	public String galleryAdminPage(GalleryVO vo) {
		System.out.println("[GalleryController][galleryAdminPage]");
		return "admin_gallery/gallery";
	}

	@RequestMapping("/gallery/insert.do")
	public String insert(GalleryVO vo, HttpServletRequest request) throws IOException {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
		String upload_location = request.getSession().getServletContext().getRealPath("/resources/images");
		System.out.println("[GalleryController][insert]");
		MultipartFile galleryImage = vo.getUpload();
		
		if(galleryImage != null ) {
			String fileName = galleryImage.getOriginalFilename();
			//galleryImage.transferTo(new File("D:/upload/"+fileName));
			galleryImage.transferTo(new File(upload_location, fileName));
			vo.setGalleryImage(fileName);
		}
		galleryService.insert(vo);
		return "admin_gallery/gallery";
	}

	@RequestMapping("/gallery/update.do")
	public void update(GalleryVO vo) {
		System.out.println("[GalleryController][update]");
		galleryService.update(vo);
	}

	@RequestMapping("/gallery/delete.do")
	public void delete(GalleryVO vo) {
		System.out.println("[GalleryController][delete]");
		galleryService.delete(vo);
	}

	@RequestMapping("/gallery/selectOne.do")
	@ResponseBody
	public GalleryVO selectOne(GalleryVO vo, Model model) {
		System.out.println("[GalleryController][selectOne]");
		return galleryService.selectOne(vo);
	}

	@RequestMapping("/gallery/selectList.do")
	@ResponseBody
	public List<GalleryVO> selectList(Model model) {
		System.out.println("[GalleryController][selectList]");
		return galleryService.selectList();
	}
}
