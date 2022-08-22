package com.mbn.handlers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.mbn.pojo.User;
import com.mbn.service.UserService;

@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	@Autowired
	private UserService userDetailsService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		User user = userDetailsService.getUserByUsername(authentication.getName());
		request.getSession().setAttribute("currentUser", user);
		response.sendRedirect("/SaleWeb/");
	}
}
