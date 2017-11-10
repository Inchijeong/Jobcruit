package com.jobcruit.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import lombok.extern.java.Log;

@Log
public class CheckInterceptor extends HandlerInterceptorAdapter {

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
		
		log.info(req.getMethod());
		
		if (req.getMethod().equals("GET")) {
			req.getSession().setAttribute("dest", uri + query);
		}
		
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	
//		log.info("체크 인터셉터 걸림");
		
		Object value = request.getSession().getAttribute("login");
		
		if(value != null) {
			return true;
		}
		
		if(value == null) {
		
			Cookie loginCookie = WebUtils.getCookie(request, "mnoCookie");
			
			if(loginCookie != null) {
				request.getSession().setAttribute("login", loginCookie.getValue());
				return true;
			}
			
		}
		
		saveDest(request);
		
		response.sendRedirect("/job/member/login");
//		log.info("사용자 정보없음 마페에서 로그인으로 이동");
		return false;
		
	}
	
}
