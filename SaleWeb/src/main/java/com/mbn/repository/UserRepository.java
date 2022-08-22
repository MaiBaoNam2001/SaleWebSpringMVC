package com.mbn.repository;

import com.mbn.pojo.User;

public interface UserRepository {
	User getUserByUsername(String username);

	boolean addUser(User user);
}
