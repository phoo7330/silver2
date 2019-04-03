package com.scit.silver.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		String contextPath = request.getContextPath();
		
		String nomalId = (String) session.getAttribute("nomalId");
		System.out.println(nomalId);
		String workerId = (String) session.getAttribute("workerId");
		System.out.println(workerId);
		String managerId= (String) session.getAttribute("managerId");
		System.out.println(managerId);
		String adminId= (String) session.getAttribute("adminId");
		System.out.println(adminId);
		String usertype = (String) session.getAttribute("usertype");
		System.out.println(usertype);
		String requestURI = request.getRequestURI();
		System.out.println(requestURI);
		String uri = requestURI.substring(requestURI.lastIndexOf("/")+1);
		System.out.println(uri);
		// 일반사용자만 가능한 요청
		String nomalURI ="";
		
		// 구직자만 가능한 요청
		String workerURI ="";
		
		// 기관관리자만 가능한 요청
		String managerURI = "";
		
		// 사이트관리자만 가능한 요청
		String adminURI = "";
		
		// 세션의 아이디값 검사
		if(nomalId == null && workerId == null && managerId == null && adminId == null) {
			response.sendRedirect(contextPath + "/login");  // 주소 표시줄 확인

			return false;
		// 사용자타입별 권한검사	
		} else {
			if(usertype.equals("1")  && nomalURI.contains(uri) || 
				usertype.equals("2") && workerURI.contains(uri) ||
				usertype.equals("3") && managerURI.contains(uri) ||
				usertype.equals("10") && adminURI.contains(uri)) {
				
				//session.removeAttribute("loginId"); 세션에 있는값 지우기
				
				
				session.setAttribute("msg", "현재 아이디로 해당 권한이 없습니다. 홈으로 돌아갑니다.");
				
				response.sendRedirect(contextPath + "/index"); //권한실패시 index.jsp로 돌아간다.
				
				return false;
				
			} else {
				return true;
			}
			
		}
	}
}
