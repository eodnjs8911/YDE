package com.yedam.yde.gallery;

import java.io.File;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import org.springframework.web.multipart.support.MultipartFilter;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.yde.gallery.GalleryService;
import com.yedam.yde.gallery.GalleryVO;

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
	public String galleryAdminEditPage(GalleryVO gallery, Model model) {
		System.out.println("[GalleryController][galleryAdminPage]");
		//GalleryVO gallery = new GalleryVO();
		//gallery.setGalleryNo(galleryNo);
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
		MultipartFile upload = vo.getUpload();
		
		if(upload != null ) {
			String fileName = upload.getOriginalFilename();
			//galleryImage.transferTo(new File("D:/upload/"+fileName));
			upload.transferTo(new File(upload_location, fileName));
			vo.setGalleryImage(fileName);
		}
		galleryService.insert(vo);
		return "admin_gallery/gallery";
	}

	@RequestMapping("/gallery/update.do")
	public String update( GalleryVO vo, HttpServletRequest request) throws IOException {
		System.out.println("[GalleryController][update]");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
		String upload_location = request.getSession().getServletContext().getRealPath("/resources/images");
		MultipartFile upload = vo.getUpload();
		
		if(upload != null && upload.getSize() > 0) {
			String fileName = upload.getOriginalFilename();
			//galleryImage.transferTo(new File("D:/upload/"+fileName));
			upload.transferTo(new File(upload_location, fileName));
			vo.setGalleryImage(fileName);
		}/*else {
			vo.setGalleryImage(defaultImage);
		}*/
		galleryService.update(vo);
		return "cs/gallery";
	}

	@RequestMapping("/gallery/delete.do")
	public String delete(GalleryVO vo) {
		System.out.println("[GalleryController][delete]");
		galleryService.delete(vo);
		return "cs/gallery";
	}

	@RequestMapping("/gallery/selectOne.do")
	@ResponseBody
	public GalleryVO selectOne(GalleryVO vo, Model model) {
		System.out.println("[GalleryController][selectOne]");
		return galleryService.selectOne(vo);
	}
	
	@RequestMapping("/gallery/view/{galleryNo}")
	public ModelAndView getGallery(@PathVariable int galleryNo, ModelAndView mv) {
		GalleryVO gallery = new GalleryVO();
		gallery.setGalleryNo(galleryNo);
		mv.addObject("gallery", galleryService.selectOne(gallery));
		mv.setViewName("cs/gallery_detail");
		System.out.println("[GalleryController][selectOneSeq]");
		return mv;
	}	
	
	@RequestMapping("/gallery/galleryDetailAdminPage.do/Admin{galleryNo}")
	public ModelAndView getGalleryList(@PathVariable int galleryNo, ModelAndView mv) {
		GalleryVO gallery = new GalleryVO();
		gallery.setGalleryNo(galleryNo);
		mv.addObject("gallery", galleryService.selectOne(gallery));
		mv.setViewName("admin_gallery/galleryView");
		System.out.println("[GalleryController][selectOneSeq]");
		return mv;
	}	
	

	@RequestMapping("/gallery/galleryListAdminPage.do/")
	public String selectadminList(Model model) {
		System.out.println("[GalleryController][selectList]");
		model.addAttribute("gallery",galleryService.selectList());
		return "admin_gallery/galleryView";
	}

	
	@RequestMapping("/gallery/selectList.do")
	public String selectList(Model model) {
		System.out.println("[GalleryController][selectList]");
		model.addAttribute("gallery",galleryService.selectList());
		return "cs/gallery";
	}

}
