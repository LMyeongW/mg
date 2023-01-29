package com.study.demo.interceptor;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.study.demo.vo.employeeVO;

public class AdminInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		employeeVO memberData = (employeeVO)session.getAttribute("member");
		if(memberData ==  null || memberData.getAdminCk() == 0) { //관리자 계정이 아닌 경우
			System.out.println("관리자권한 없음");
			response.sendRedirect("/main");  //메인페이지 리다이렉트
			return false;
		} else {
			
			return true; // 관리자 계정 로그인 경우(memberData != null && memberData.getAdminCk() == 1)
		}
		
	}

	

	
}
