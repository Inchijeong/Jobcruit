package com.jobcruit.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		Object obj = modelAndView.getModel().get("email");
		
		if(obj == null) {
			response.sendRedirect("/job/member/login?msg=fail");
			return;
		}
		
		request.getSession().setAttribute("login", obj);
		
		try {
			Boolean remember = (Boolean)modelAndView.getModel().get("rememberMe");
			
			if(remember) {
				Cookie loginCookie = new Cookie("login", obj.toString());
				loginCookie.setMaxAge(60*60*24*7);
				response.addCookie(loginCookie);
			}
		} catch (Exception e) {
			
		}
		
	}

}
