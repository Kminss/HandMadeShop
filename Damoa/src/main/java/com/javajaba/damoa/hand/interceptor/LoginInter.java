package com.javajaba.damoa.hand.interceptor;

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
		logger.info("req url....." + request.getHeader("referer"));
		if (request.getSession().getAttribute("member") == null) {
			response.sendRedirect("/member/login");
			return false;
		}
		return true;
	}
}
