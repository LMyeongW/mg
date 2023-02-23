package com.study.demo.employee;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.study.demo.employee.service.AnnouncementService;
import com.study.demo.vo.AnnouncementPage;
import com.study.demo.vo.AnnouncementVO;
import com.study.demo.vo.Page;

@Controller
@RequestMapping("/announcement")
public class AnnouncementController {
	@Autowired
	private AnnouncementService announcementService;
	
	//공지 상세페이지
	@RequestMapping(value="/detail",  method = RequestMethod.GET)
	public ModelAndView announcementDetail(@RequestParam("announcementNo")int announcementNo) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("data", announcementService.announcementDetail(announcementNo));

		mav.setViewName("/announcement/announcementDetail");
		return mav;
	}
	
	//리스트페이지
	@RequestMapping(value="/listPage", method = RequestMethod.GET)
	public ModelAndView announcementList(@RequestParam(value="num", defaultValue = "1")int num) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/announcement/announcementList");
		return mav;
	}
	
	//공지 전체 리스트
	@RequestMapping(value="/listAll", method = RequestMethod.GET)
	public ModelAndView announcementAll(@RequestParam(value="num", defaultValue = "1")int num) {
		ModelAndView mav = new ModelAndView();
		
		Page page = new Page();
		page.setNum(num);
		page.setTotalCount(announcementService.announcementTotalcount());
		HashMap<String, Object> rtnMap = new HashMap<String, Object>();
		
		List<AnnouncementVO> list = announcementService.announcementAll(page.getSqlPostNum(), page.getPostNum());
		
		rtnMap.put("list", list);
		rtnMap.put("page", page);
		rtnMap.put("select", num);
		
		mav.addObject("data", rtnMap);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	//공지 리스트
	@RequestMapping(value="/listNotify", method = RequestMethod.GET)
	public ModelAndView announcementNotify(@RequestParam(value="num", defaultValue = "1")int num) {
		ModelAndView mav = new ModelAndView();
		
		Page page = new Page();
		page.setNum(num);
		page.setTotalCount(announcementService.announcementNotifyTotalcount());
		HashMap<String, Object> rtnMap = new HashMap<String, Object>();
		
		List<AnnouncementVO> list = announcementService.announcementNotify(page.getSqlPostNum(), page.getPostNum());
		
		rtnMap.put("list", list);
		rtnMap.put("page", page);
		rtnMap.put("select", num);
		
		mav.addObject("data", rtnMap);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	//공지 이벤트 리스트
	@RequestMapping(value="/listEvent", method = RequestMethod.GET)
	public ModelAndView announcementEvent(@RequestParam(value="num", defaultValue = "1")int num) {
		ModelAndView mav = new ModelAndView();
		
		Page page = new Page();
		page.setNum(num);
		page.setTotalCount(announcementService.announcementEventTotalcount());
		HashMap<String, Object> rtnMap = new HashMap<String, Object>();
		
		List<AnnouncementVO> list = announcementService.announcementEvent(page.getSqlPostNum(), page.getPostNum());
		
		rtnMap.put("list", list);
		rtnMap.put("page", page);
		rtnMap.put("select", num);
		
		mav.addObject("data", rtnMap);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/inList", method = RequestMethod.GET)
	public ModelAndView announcementDetailList(@RequestParam(value="num", defaultValue = "1")int num,
			@ModelAttribute("categoryType")String categoryType, 
			@ModelAttribute("detailNum")String detailNum) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println(categoryType);
		AnnouncementPage announcementpage = new AnnouncementPage();
		announcementpage.setNum(num);
		announcementpage.setTotalCount(announcementService.detailListTotalcount(categoryType));
		HashMap<String, Object> rtnMap = new HashMap<String, Object>();
		
		List<AnnouncementVO> list = announcementService.announcementDetailList(announcementpage.getSqlPostNum(), announcementpage.getPostNum(), categoryType ,detailNum);
		
		rtnMap.put("list", list);
		rtnMap.put("page", announcementpage);
		rtnMap.put("select", num);
		
		mav.addObject("data", rtnMap);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
}
