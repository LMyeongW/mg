package com.study.demo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.study.demo.vo.employeeVO;


public class ApplicationInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		employeeVO employeevo = (employeeVO)session.getAttribute("member");
		
		if(employeevo == null) {
			response.sendRedirect("/main");
			return false;
		} else {
			return true;
		}
		
		
	}






}
