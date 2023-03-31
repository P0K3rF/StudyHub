package com.studyhub.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.studyhub.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	Optional<User> findByEmail(String email);
	boolean existsByEmail(String email);
	
	Optional<User> findByMobileNo(String mobileNo);
}
