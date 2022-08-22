package com.mbn.pojo;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * The persistent class for the user database table.
 * 
 */
@Entity
@NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	private byte active;

	@Pattern(regexp = "^[A-Za-z0-9+_.-]+@(.+)$", message = "{user.email.invalidErr}")
	private String email;

	@Column(name = "first_name")
	@Size(min = 1, max = 50, message = "{user.firstName.sizeErr}")
	private String firstName;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "last_name")
	@Size(min = 1, max = 50, message = "{user.lastName.sizeErr}")
	private String lastName;
	@NotEmpty(message = "{user.password.sizeErr}")
	private String password;

	@Size(min = 10, max = 10, message = "{user.phone.sizeErr}")
	private String phone;

	@Column(name = "user_role")
	private String userRole;

	private String username;

	@OneToMany
	@JsonIgnore
	private Set<Comment> comments;

	public User() {
	}

	public byte getActive() {
		return this.active;
	}

	public void setActive(byte active) {
		this.active = active;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUserRole() {
		return this.userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
}