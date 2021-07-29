package com.javajaba.damoa.member.interceptor;

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInter extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(LoginInter.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (request.getSession().getAttribute("member") == null) {
			response.sendRedirect("/member/login");
			return false;
		}
		return true;
	}
}
