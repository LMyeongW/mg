package com.study.demo.employee;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.study.demo.employee.service.ApplicationService;
import com.study.demo.vo.ApplicationVO;
import com.study.demo.vo.MainPage;

@Controller
public class MainController {
	@Autowired
	private ApplicationService applicationService;
	
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView submitlistGet() {

		return new ModelAndView("/main");
	}
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public ModelAndView submitlistPost(@ModelAttribute("applicationvo")ApplicationVO appvo,
			@RequestParam(value="num", defaultValue = "1")int num,
			String employeeId
			) {
		
		System.out.println(num);
		MainPage mainPage = new MainPage();
		
		HashMap<String, Object> rtnMap = new HashMap<String, Object>();
		
		mainPage.setNum(num);
		mainPage.setTotalCount(applicationService.submitTotalcount(employeeId));
		
		System.out.println(employeeId);
		ModelAndView mav = new ModelAndView();

		List<ApplicationVO> list = applicationService.submitlist(employeeId, mainPage.getSqlPostNum(), mainPage.getPostNum());
		
		rtnMap.put("list", list);
		rtnMap.put("page", mainPage);
		rtnMap.put("select", num);
		
		mav.addObject("data", rtnMap);
		
		System.out.println(rtnMap);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
}
