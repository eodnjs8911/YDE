package com.yedam.yde.resource;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ResourceController {
	@Autowired
	ResourceService resourceService;
	
	@RequestMapping("/resource/resourceAdminPage.do")
	public String resourceAdminPage(ResourceVO vo) {
		System.out.println("[ResourceController][resourceAdminPage]");
		return "admin_resource/resource";
	}

	@RequestMapping("/resource/insert.do")
	public void insert(ResourceVO vo) {
		System.out.println("[ResourceController][insert]");
		resourceService.insert(vo);
	}

	@RequestMapping("/resource/update.do")
	public void update(ResourceVO vo) {
		System.out.println("[ResourceController][update]");
		resourceService.update(vo);
	}

	@RequestMapping("/resource/delete.do")
	public void delete(ResourceVO vo) {
		System.out.println("[ResourceController][delete]");
		resourceService.delete(vo);
	}

	@RequestMapping("/resource/selectOne.do")
	@ResponseBody
	public ResourceVO selectOne(ResourceVO vo, Model model) {
		System.out.println("[ResourceController][selectOne]");
		return resourceService.selectOne(vo);
	}

	@RequestMapping("/resource/selectList.do")
	@ResponseBody
	public List<ResourceVO> selectList(Model model) {
		System.out.println("[ResourceController][selectList]");
		return resourceService.selectList();
	}
	
	@RequestMapping("/resource/edit.do")
	@ResponseBody
	public void edit(@RequestParam(value="oper",defaultValue="",required=false)String oper,
			@RequestParam(value="id",defaultValue="",required=false)String id,ResourceVO vo) {
		System.out.println("[ResourceController][edit]");
		System.out.println(vo);
		if(oper.equals("add")) {
			resourceService.insert(vo);
		}else if(oper.equals("edit")) {
			resourceService.update(vo);
		}else if(oper.equals("del")) {
			System.out.println(id);
			if(id.length()>0) {
				for(String i : id.split(",")) {
					vo.setResourceNo(Integer.parseInt(i));
					resourceService.delete(vo);
				}
			}
		}
	}
}
