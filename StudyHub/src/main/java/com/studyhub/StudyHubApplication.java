package com.studyhub;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import com.studyhub.entity.Course;
import com.studyhub.repository.CourseRepository;

@SpringBootApplication
public class StudyHubApplication {

	@Autowired
	CourseRepository courseRepository;

	public static void main(String[] args) {
		SpringApplication.run(StudyHubApplication.class, args);
	}

//	@Bean
	public void setData() {
		Course c=new Course();
		c.setSemester("SEMESTER VI");
//		Object Oriented Programming
//		Microprocessor Architecture
//		Web Programming
//		Numerical and Statistical Methods
//		Green Computing
		
//		Python Programming
//		Data structures
//		Computer Networks
//		Database Management System
//		Applied Mathematics
		
//		Core Java
//		Introduction to Embedded Systems
//		Computer Oriented Statistical Techniques
//		Software Engineering
//		Computer Graphics and Animation
		
//		Software Project Management
//		Internet of Things
//		Advanced Web Programming
//		Artificial Intelligence
//		Enterprise Java
		
//		Software Quality Assurance
//		Security in Computing
//		Business Intelligence
//		Enterprise Networking
//		Cyber Laws
		
		c.setSubjects("Cyber Laws Practical");
		this.courseRepository.save(c);

	}
}
