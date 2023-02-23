package com.study.demo.employee;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.study.demo.employee.service.ApplicationService;
import com.study.demo.vo.ApplicationVO;
import com.study.demo.vo.employeeVO;

@Controller
@RequestMapping("/application")
public class ApplicationController {
	@Autowired
	private ApplicationService applicationService;
	
	//신청서페이지
	@RequestMapping("/submit")
	public ModelAndView submitGet() {
		return new ModelAndView("/application/submitPage");
	}
	
	//신청서작성
	@PostMapping("/submit")
	@ResponseBody
	public String submitPost(@ModelAttribute("appvo")ApplicationVO appvo,
			HttpServletRequest request) {
		
		System.out.println(appvo);
		HttpSession session = request.getSession();
		employeeVO employeevo = (employeeVO)session.getAttribute("member");
		if(employeevo == null) { //로그인하지 않았다면 면 5반환
			return "5";
		}

		int result = applicationService.submitPost(appvo);
		
		return result+"";
	}
	
	//신청서 수정페이지
	@RequestMapping(value = "/submitUpdate", method = RequestMethod.GET)
	public ModelAndView submitUpdateGet(@ModelAttribute("applicationvo")ApplicationVO applicationvo,
			@RequestParam("applNo")int applNo,
			HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String employeeId = (String) session.getAttribute("employeeId");
		applicationvo.setEmployeeId(employeeId);
		System.out.println(employeeId);
		
		mav.addObject("data", applicationService.submitUpdateGet(applNo));
		
		mav.setViewName("/application/submitUpdate");
		return mav;
	}
	
	//신청서 수정
	@RequestMapping(value = "/submitUpdate", method = RequestMethod.POST)
	
	public ModelAndView submitUpdatePost(@ModelAttribute("applicationvo")ApplicationVO applicationvo) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println(applicationvo);
		
		applicationService.submitUpdatePost(applicationvo);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	//신청서 취소
	@RequestMapping(value = "/submitCencel",  method = RequestMethod.GET)
	public ModelAndView submitCencel(@ModelAttribute("applicationvo")ApplicationVO applicationvo) {
		ModelAndView mav = new ModelAndView();
		
		applicationService.submitCencel(applicationvo);
		
		mav.setViewName("redirect:/main");
		return mav;
	}
	
	
	
	
}
