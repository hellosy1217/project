package com.web.blueballoon.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	private HttpSession session;
	//컨트롤러 실행 직전 수행됨.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("client IP = "+request.getRemoteAddr());//user IP;
		
		session = request.getSession();
		
		if(session.getAttribute("member_email") != null) {
			logger.info("clear login");
			session.removeAttribute("member_email");
		}
		
		return true;
	}
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		session = request.getSession();
		
		ModelMap modelMap = modelAndView.getModelMap();
		Object memberDTO = modelMap.get("memberDTO");
		if(memberDTO != null) {
			logger.info("new login");
			session.setAttribute("login", memberDTO);
			response.sendRedirect("/");
		}else {
			response.sendRedirect("member_login");
		}
	}
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("");
	}
	
}
