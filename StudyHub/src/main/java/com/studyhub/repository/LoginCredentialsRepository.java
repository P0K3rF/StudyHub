package com.studyhub.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.studyhub.entity.LoginCredentials;

public interface LoginCredentialsRepository extends JpaRepository<LoginCredentials, String>{

}
