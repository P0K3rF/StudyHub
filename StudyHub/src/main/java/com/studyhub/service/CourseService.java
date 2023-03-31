package com.studyhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studyhub.entity.Course;
import com.studyhub.repository.CourseRepository;

@Service
public class CourseService {
	@Autowired
	private CourseRepository courseRepository;

	public List<String> getAllSemester() {
		return this.courseRepository.getAllSemesterName();
	}

	public List<Course> getSemesterSyllabus(String semester) {
		return this.courseRepository.getSemesterSyllabus(semester);
	}
}
