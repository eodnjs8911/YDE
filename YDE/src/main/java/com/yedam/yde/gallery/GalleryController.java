package com.yedam.yde.gallery;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("/gallery/galleryAdminEditPage.do")
	public String galleryAdminEditPage(@RequestParam(value="gelleryNo", required=false)Integer galleryNo, Model model) {
		System.out.println("[GalleryController][galleryAdminPage]");
		GalleryVO gallery = new GalleryVO();
		gallery.setGalleryNo(galleryNo);
		model.addAttribute("gallery", galleryService.selectOne(gallery));
		return "admin_gallery/galleryEdit";
	}
	
	@RequestMapping("/admin_gallery/ckeditorUpload")
	public String ckeditorUpload(FileBean fileBean, HttpServletRequest request, Model model) throws FileUploadException {
		HttpSession session = request.getSession();
		String root_path = session.getServletContext().getRealPath("/");
		String attach_path ="resources/images/";
		
		MultipartFile upload = fileBean.getUpload();
		String filename ="";
		String CKEditorFuncNum ="";
		
		if (upload != null) { 
			filename = upload.getOriginalFilename(); 
			fileBean.setFilename(filename); 
			CKEditorFuncNum = fileBean.getCKEditorFuncNum();
			try { 
				File file = new File(root_path + attach_path + filename); 
				//logger.info(root_path + attach_path + filename); 
				upload.transferTo(file); 
				} catch (IOException e) {
					e.printStackTrace();
				}
			} 
		
			String file_path = "/yde/" + attach_path + filename; 
			model.addAttribute("file_path", file_path); 
			model.addAttribute("CKEditorFuncNum", CKEditorFuncNum); 
			return "admin_gallery/upload";	
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
	public String selectList(Model model) {
		System.out.println("[GalleryController][selectList]");
		model.addAttribute("gallery",galleryService.selectList());
		return "cs/gallery";
	}

}
