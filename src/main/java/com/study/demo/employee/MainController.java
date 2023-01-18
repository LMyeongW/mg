package com.study.demo.employee;

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
			String employeeId) {
		
		System.out.println(employeeId);
		ModelAndView mav = new ModelAndView();

		List<ApplicationVO> list = applicationService.submitlist(employeeId);
		
		System.out.println(list);
		mav.addObject("data", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
}
