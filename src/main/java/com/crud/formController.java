package com.crud;

import java.io.FileOutputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class formController {

	@Autowired
	empDao empdao;

	@RequestMapping("/loadUserForm")
	public ModelAndView userForm() {
		return new ModelAndView("UserForm");
	}

	@PostMapping("/saveData")
	public ModelAndView saveData(@ModelAttribute empEntity emp) throws Exception {
		if(emp.getTempEmpImg().getSize() > 0) {
			String path="D:/Siraj's Workspace/HIBERNATE/MVCCRUD/src/main/webapp/WEB-INF/images/"+emp.getTempEmpImg().getOriginalFilename();
			FileOutputStream file=new FileOutputStream(path);
			byte[] data=emp.getEmpImg().getBytes();
			file.write(data);
			file.close();
			emp.setEmpImg(emp.getTempEmpImg().getOriginalFilename());
		}
		if(emp.getId()>0) {
			empdao.updateData(emp);
		}
		else {
			empdao.saveData(emp);
		}
		return new ModelAndView("redirect:/loadViewEmp");
	}
	
	@RequestMapping("/loadViewEmp")
	public ModelAndView loadViewEmp() {
		List<empEntity>emplist=empdao.getEmpAll();
		return new ModelAndView("viewEmp","empList",emplist);
	}
	
	@RequestMapping("/delEmp/{id}")
	public ModelAndView delEmp(@PathVariable int id) {
		empdao.deleteEmp(id);
		return new ModelAndView("redirect:/loadViewEmp");
	}
	
	@RequestMapping("/editEmp/{id}")
	public ModelAndView editEmp(@PathVariable int id) {
		empEntity emp= empdao.getEmpById(id);
		return new ModelAndView("UserForm","empData",emp);
	}
	
}
