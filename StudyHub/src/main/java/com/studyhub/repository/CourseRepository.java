package com.studyhub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.studyhub.entity.Course;

public interface CourseRepository extends JpaRepository<Course, Integer>{
	
	@Query(nativeQuery = true,value = "select distinct semester from course")
	List<String> getAllSemesterName();
	
	@Query(nativeQuery = true,value = "select * from course where semester=:semester")
	List<Course> getSemesterSyllabus(@Param("semester") String semester);
}
