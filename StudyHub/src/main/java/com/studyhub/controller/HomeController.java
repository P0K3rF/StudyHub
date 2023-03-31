package com.studyhub.controller;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityExistsException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.studyhub.dto.CourseDto;
import com.studyhub.entity.LoginCredentials;
import com.studyhub.entity.User;
import com.studyhub.service.CourseService;
import com.studyhub.service.LoginCredentialsService;
import com.studyhub.service.UserService;

@Controller
public class HomeController {
	@Autowired
	UserService service;

	@Autowired
	LoginCredentialsService credentialsService;
	@Autowired
	CourseService courseService;

	@GetMapping({ "/", "/home" })
	public String renderHomePage(Model m) {
		List<CourseDto> listofCourse = new ArrayList<>();
		for (String s : this.courseService.getAllSemester()) {
			if (s.equals("SEMESTER I")) {
				CourseDto dto = new CourseDto(s, "1 sem.jpeg");
				listofCourse.add(dto);
			}
			if (s.equals("SEMESTER II")) {
				CourseDto dto = new CourseDto(s, "2 sem.jpeg");
				listofCourse.add(dto);
			}
			if (s.equals("SEMESTER III")) {
				CourseDto dto = new CourseDto(s, "3 sem.jpeg");
				listofCourse.add(dto);
			}
			if (s.equals("SEMESTER IV")) {
				CourseDto dto = new CourseDto(s, "4 sem.jpeg");
				listofCourse.add(dto);
			}
			if (s.equals("SEMESTER V")) {
				CourseDto dto = new CourseDto(s, "5 sem.jpeg");
				listofCourse.add(dto);
			}
			if (s.equals("SEMESTER VI")) {
				CourseDto dto = new CourseDto(s, "6 sem.png");
				listofCourse.add(dto);
			}

		}
		m.addAttribute("course", listofCourse);
		System.out.println("Hello");
		return "home";
	}

	@RequestMapping("/register")
	public String registration() {
		return "register";
	}

	@PostMapping("/register")
	public String processFormRegister(User user, @RequestParam(required = false, name = "msg") String message,
			Model m) {

		if (message != null) {
			m.addAttribute("errormsg", message);
		}
		try {
			this.service.insertCustomer(user);
			return "redirect:/login?msg=successfully register";
		} catch (EntityExistsException e) {
			return "redirect:register?msg=Email already exists";
		}

	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	// Login Process
	@PostMapping("/login")
	public String postLogin(LoginCredentials credentials, HttpSession session) {
		if (this.credentialsService.validate(credentials)) {
			session.setAttribute("user", this.service.getUserByEmail(credentials.getEmail()));
			return "redirect:/";
		} else {
			return "redirect:login?msg=Invalid Credentials";
		}
	}
	
	@GetMapping("/syllabus")
	public String syllabusPage(@RequestParam("course") String semester ,Model m,HttpSession session) {
		User user=(User)session.getAttribute("user");
		if(user!=null) {
			m.addAttribute("syllabus", this.courseService.getSemesterSyllabus(semester));
			return "syllabus";	
		}
		else {
			return "redirect:login";
		}	
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		User user=(User)session.getAttribute("user");
		if(user!=null) {
			session.removeAttribute("user");
			session.setAttribute("user", null);
		}
		return "redirect:home";
		
	}

}
