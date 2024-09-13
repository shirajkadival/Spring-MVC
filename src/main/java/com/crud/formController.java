package com.crud;

import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class formController {

	@Autowired
	empDao empdao;

	@RequestMapping("/LoginForm")
	public ModelAndView loginForm() {
		return new ModelAndView("LoginForm");
	}

	@RequestMapping("/loadUserForm")
	public ModelAndView userForm() {
		return new ModelAndView("UserForm");
	}

	@RequestMapping("/loadEmpDetail")
	public ModelAndView EmpDetail() {
		return new ModelAndView("EmpDetail");
	}

	@PostMapping("/LoginForm")
	public ModelAndView procesLogin(@RequestParam("name") String name, @RequestParam("password") String password) {
		users user = empdao.getUser(name, password);
		if (user != null) {
			if ("admin".equalsIgnoreCase(name) && "admin123".equalsIgnoreCase(password)) {
				return new ModelAndView("redirect:/loadViewEmp");
			} else if (name.equalsIgnoreCase(user.getName()) && password.equalsIgnoreCase(user.getPassword())) {
				empEntity emp= empdao.getEmpById(user.getId());
				return new ModelAndView("EmpDetail","empData",emp);
			}
		}
		String error="Invalid username or password";
		return new ModelAndView("LoginForm","error",error);
	}

	@PostMapping("/saveData")
	public ModelAndView saveData(@ModelAttribute empEntity emp, @ModelAttribute users user, HttpSession session)
			throws Exception {
		if (emp.getTempEmpImg().getSize() > 0) {
			String path = session.getServletContext().getRealPath("/") + emp.getTempEmpImg().getOriginalFilename();
			FileOutputStream file = new FileOutputStream(path);
			byte[] data = emp.getEmpImg().getBytes();
			file.write(data);
			file.close();
			emp.setEmpImg(emp.getTempEmpImg().getOriginalFilename());
		}
		if (emp.getId() > 0) {
			empdao.updateData(emp);
		} else {
			empdao.saveUser(user);
			empdao.saveData(emp);
		}
		return new ModelAndView("redirect:/LoginForm");
	}

	@RequestMapping("/loadViewEmp")
	public ModelAndView loadViewEmp() {
		List<empEntity> emplist = empdao.getEmpAll();
		return new ModelAndView("viewEmp", "empList", emplist);
	}

	@RequestMapping("/delEmp/{id}")
	public ModelAndView delEmp(@PathVariable int id) {
		empdao.deleteEmp(id);
		return new ModelAndView("redirect:/loadViewEmp");
	}

	@RequestMapping("/editEmp/{id}")
	public ModelAndView editEmp(@PathVariable int id) {
		empEntity emp = empdao.getEmpById(id);
		return new ModelAndView("UserForm", "empData", emp);
	}

}
