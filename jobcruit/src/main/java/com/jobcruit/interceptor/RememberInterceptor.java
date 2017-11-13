package com.jobcruit.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import lombok.extern.java.Log;

@Log
public class RememberInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}
	
	// 이전 페이지 uri session에 올리기
	private void saveDest(HttpServletRequest req) {
		String uri = req.getRequestURI();
		
		String query = req.getQueryString();
		
		if (query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}
		
//		log.info(req.getMethod());
		
		if (req.getMethod().equals("GET")) {
			req.getSession().setAttribute("dest", uri + query);
		}
		
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	
		log.info("체크 인터셉터 걸림");
		
		Object value = request.getSession().getAttribute("login");
		
		if(value != null) {
			log.info("세션에 있음");
		}
		
		if(value == null) {
		
			log.info("세션에 없음");
			Cookie loginCookie = WebUtils.getCookie(request, "mnoCookie");
			
			if(loginCookie != null) {
				request.getSession().setAttribute("login", loginCookie.getValue());
				log.info("세션 x 쿠키 o 로그인으로 가면안돼");
			}
			log.info("세션 쿠키 둘다 없음");
			
		}
		
		saveDest(request);
		
		
		return true;
		
		
	}
	
}
