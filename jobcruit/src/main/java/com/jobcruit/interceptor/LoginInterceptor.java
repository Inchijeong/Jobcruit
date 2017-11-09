package com.jobcruit.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.java.Log;

@Log
public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
//		log.info("" + modelAndView.getModel().get("mno"));
		Object mno = modelAndView.getModel().get("mno");
		request.getSession().setAttribute("mnoSession", mno);
//		log.info("생성된 세션 :" + request.getSession().getAttribute("mnoSession"));
		
		try {
			Boolean remember = (Boolean)modelAndView.getModel().get("rememberMe");
			log.info("remember :" + remember.toString());
			if(remember) {
				Cookie loginCookie = new Cookie("mnoCookie", mno.toString());
//				log.info("생성된 쿠키: " + loginCookie.getValue());
				loginCookie.setMaxAge(60*60*24*7);
				response.addCookie(loginCookie);
			}
		} catch (Exception e) {
			
		}
		
	}

}
