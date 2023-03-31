package com.studyhub.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studyhub.entity.LoginCredentials;
import com.studyhub.repository.LoginCredentialsRepository;

@Service
public class LoginCredentialsService {
	@Autowired
	LoginCredentialsRepository credentialsRepository;

	// Validating Login credentials
	public boolean validate(LoginCredentials credentials) {

		if (this.credentialsRepository.existsById(credentials.getEmail())) {
			Optional<LoginCredentials> optionalCredentials = this.credentialsRepository
					.findById(credentials.getEmail());
			if (optionalCredentials.isPresent()) {
				String password = optionalCredentials.get().getPassword();
				if (password.equals(credentials.getPassword()))
					return true;
			}
			return false;
		}
		return false;
	}

}
