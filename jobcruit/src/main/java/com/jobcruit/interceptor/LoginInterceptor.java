package com.jobcruit.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import lombok.extern.java.Log;

@Log
public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		log.info("로그인 인터셉터 들어옴");
		HttpSession session = request.getSession(); 
		
//		log.info("가져온 mno" + modelAndView.getModel().get("mno"));
		Object mno = modelAndView.getModel().get("mno");
		session.setAttribute("login", mno);
//		log.info("생성된 세션 :" + request.getSession().getAttribute("login"));
		
		// 로그인 유지
		try {
			Boolean remember = (Boolean)modelAndView.getModel().get("rememberMe");
//			log.info("remember :" + remember.toString());
			if(remember) {
				Cookie loginCookie = new Cookie("mnoCookie", mno.toString());
//				log.info("생성된 쿠키: " + loginCookie.getValue());
				loginCookie.setMaxAge(60*60*24*7);
				loginCookie.setPath("/job");
				response.addCookie(loginCookie);
			}
		} catch (Exception e) {
		}
		
		// 아이디 저장
		try {
			Boolean rememberId = (Boolean)modelAndView.getModel().get("rememberId");
			if(rememberId != null) {
				Cookie loginCookie = new Cookie("rememberId", modelAndView.getModel().get("email").toString());
				loginCookie.setMaxAge(60*60*24*7);
				loginCookie.setPath("/job");
				response.addCookie(loginCookie);
			} else {
				Cookie idCookie = WebUtils.getCookie(request, "rememberId");
				idCookie.setMaxAge(0);
				idCookie.setPath("/job");
				response.addCookie(idCookie);
			}
		} catch (Exception e) {
		}
		
		Object dest = session.getAttribute("dest");
		log.info("---------------------dest:" + dest);
		boolean isDisplay = dest.toString().contains("/display");
		response.sendRedirect(dest != null && !isDisplay? (String)dest : "/job/common/main");
		
	}

}
