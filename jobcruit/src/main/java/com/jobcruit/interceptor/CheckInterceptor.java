package com.jobcruit.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

public class CheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Object value = request.getSession().getAttribute("login");
		
		if(value != null) {
			return true;
		}
		
		if(value == null) {
		
			Cookie loginCookie = WebUtils.getCookie(request, "login");
			
			if(loginCookie != null) {
				request.getSession().setAttribute("login", loginCookie.getValue());
				return true;
			}
			
		}
		
		response.sendRedirect("/job/member/login");
		return false;
		
	}
	
}
