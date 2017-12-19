package com.yedam.yde.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.yde.notice.NoticeService;
import com.yedam.yde.notice.NoticeVO;
@Controller

public class NoticeController {
	@Autowired
	NoticeService noticeService;

	@RequestMapping("/cs/notice/insert.do")
	public void insert(NoticeVO vo) {
		System.out.println("[NoticeController][insert]");
		noticeService.insert(vo);
	}

	@RequestMapping("/cs/notice/update.do")
	public void update(NoticeVO vo) {
		System.out.println("[NoticeController][update]");
		noticeService.update(vo);
	}

	@RequestMapping("/cs/notice/delete.do")
	public void delete(NoticeVO vo) {
		System.out.println("[NoticeController][delete]");
		noticeService.delete(vo);
	}

	@RequestMapping("/cs/notice/selectOne.do")
	@ResponseBody
	public NoticeVO selectOne(NoticeVO vo, Model model) {
		System.out.println("[NoticeController][selectOne]");
		return noticeService.selectOne(vo);
	}

	@RequestMapping("/cs/notice/selectList.do")
	@ResponseBody
	public List<NoticeVO> selectList(Model model) {
		System.out.println("[NoticeController][selectList]");
		return noticeService.selectList();
	}
	
	@RequestMapping("/cs/notice/edit.do")
	@ResponseBody
	public void edit(@RequestParam(value="oper",defaultValue="",required=false)String oper, 
			@RequestParam(value="id",defaultValue="",required=false)String id, NoticeVO vo) {
		System.out.println("[NoticeController][edit]");
		System.out.println(vo);
		if(oper.equals("add")) {
			noticeService.insert(vo);
		}else if(oper.equals("edit")) {
			noticeService.update(vo);
		}else if(oper.equals("del")) {
			System.out.println(id);
			if(id.length()>0) {
				for(String i : id.split(",")) {
					vo.setNoticeNo(Integer.parseInt(i));
					noticeService.delete(vo);
				}
			}
		}
	}
}
