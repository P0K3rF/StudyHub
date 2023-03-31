package com.studyhub.service;

import javax.persistence.EntityExistsException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studyhub.entity.LoginCredentials;
import com.studyhub.entity.User;
import com.studyhub.repository.LoginCredentialsRepository;
import com.studyhub.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	UserRepository repository;

	@Autowired
	LoginCredentialsRepository credentialsRepository;

	public boolean insertCustomer(User user) {

		if (!this.repository.existsByEmail(user.getEmail())) {
			this.repository.save(user);
			LoginCredentials credentials = new LoginCredentials();
			credentials.setEmail(user.getEmail());
			credentials.setPassword(user.getPassword());
			credentials.setRole("User");
			this.credentialsRepository.save(credentials);
			return true;

		} else {
			throw new EntityExistsException("Customer With the given Email id : " + user.getEmail() + " already exist");
		}
	}
	public User getUserByEmail(String email) {
		return this.repository.findByEmail(email).get();
	}

}
