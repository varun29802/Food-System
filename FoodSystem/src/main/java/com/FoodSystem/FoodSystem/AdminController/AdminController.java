package com.FoodSystem.FoodSystem.AdminController;

import java.io.File;
import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.FoodSystem.FoodSystem.Model.Admin;
import com.FoodSystem.FoodSystem.Model.FoodProduct;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

	
	@Autowired
	SessionFactory sf;
	
	@RequestMapping("/adminLog")
	public ModelAndView adminLog()
	{
		return new ModelAndView("adminLogin");
	}
	@RequestMapping("/adminindex")
	public ModelAndView adminIndex()
	{
		return new ModelAndView("adminIndex");
	}
	
	@RequestMapping("/registerAdmin")
	public ModelAndView registerAdmin(@ModelAttribute Admin admin) 
	{  
			Session ss=sf.openSession();
			Admin admin1=ss.get(Admin.class, admin.getEmail());
			if (admin1!=null) {
				return new ModelAndView("adminLogin");
				
			} else {
				Session session=sf.openSession();
				Transaction tx=session.beginTransaction();
				session.save(admin);
				tx.commit();
				return new ModelAndView("adminIndex");

			}
		}
	
	@RequestMapping("/adminLogin")
	public ModelAndView adminLogin(@ModelAttribute Admin admin,HttpServletRequest request) 
	{
        ModelAndView andView = new ModelAndView();
		
		Session session = sf.openSession();
		Admin admin1 = session.get(Admin.class,admin.getEmail());
		
		if(admin1 != null &&admin1.getEmail().equals(admin.getEmail()) && admin1.getPassword().equals(admin.getPassword()))
		{
			andView.setViewName("adminIndex");
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("name", admin1.getPassword());
			httpSession.setAttribute("email", admin1.getEmail());
			andView.addObject("message","You have login successfull");
		}
		else
		{
			andView.setViewName("adminLogin");
			andView.addObject("message","Wrong User Id Or Password");
		}
		
		return andView;
	}
	 @RequestMapping("/adminLogOut")
     public ModelAndView adminLogOut(HttpServletRequest request) 
     {
		 HttpSession ss=request.getSession(false);
		 if (ss!=null) {
			ss.invalidate();
		}
		 ModelAndView mv=new ModelAndView();
		 mv.setViewName("adminLogin");
		 mv.addObject("message","log out Succesfully...");
		 return mv;
    	 
     }
	
	
}
