package com.mbn.service.implement;

import java.util.HashSet;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.mbn.pojo.User;
import com.mbn.repository.UserRepository;
import com.mbn.service.UserService;

@Service("userDetailsService")
@Transactional
public class UserServiceImplement implements UserService {
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = this.getUserByUsername(username);
		if (user == null) {
			throw new UsernameNotFoundException("Invalid username!");
		}

		Set<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority(user.getUserRole()));
		return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(),
				authorities);
	}

	@Override
	public User getUserByUsername(String username) {
		return this.userRepository.getUserByUsername(username);
	}

	@Override
	public boolean addUser(User user) {
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		user.setActive((byte) 1);
		user.setUserRole("ROLE_USER");
		return this.userRepository.addUser(user);
	}

}
