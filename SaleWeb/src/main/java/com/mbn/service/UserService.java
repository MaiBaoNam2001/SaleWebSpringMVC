package com.mbn.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.mbn.pojo.User;

public interface UserService extends UserDetailsService {
	User getUserByUsername(String username);

	boolean addUser(User user);
}
