package com.mbn.configs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.mbn.handlers.LoginSuccessHandler;
import com.mbn.handlers.LogoutSuccessHandler;
import com.mbn.service.UserService;

@Configuration
@EnableWebSecurity
@EnableTransactionManagement
@ComponentScan(basePackages = { "com.mbn.controllers", "com.mbn.repository", "com.mbn.service", "com.mbn.formatters",
		"com.mbn.handlers" })
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	private UserService userDetailsService;
	@Autowired
	private LoginSuccessHandler loginSuccessHandler;
	@Autowired
	private LogoutSuccessHandler logoutSuccessHandler;

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.formLogin().usernameParameter("username").passwordParameter("password");
//		http.formLogin().defaultSuccessUrl("/").failureUrl("/login?error");
		http.formLogin().successHandler(loginSuccessHandler);

//		http.logout().logoutSuccessUrl("/login");
		http.logout().logoutSuccessHandler(logoutSuccessHandler);
		http.exceptionHandling().accessDeniedPage("/login?accessDenied");

		http.authorizeRequests().antMatchers("/").permitAll().antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')");

		http.csrf().disable();
	}
}
