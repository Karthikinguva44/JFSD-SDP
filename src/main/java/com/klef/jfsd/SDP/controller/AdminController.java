package com.klef.jfsd.SDP.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.SDP.model.Admin;
import com.klef.jfsd.SDP.model.Marks;
import com.klef.jfsd.SDP.model.User;
import com.klef.jfsd.SDP.service.AdminService;
import com.klef.jfsd.SDP.service.MarksService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    private MarksService marksService;
    
    
    @Autowired
	private AdminService adminService;
	
	
	@GetMapping("adminlogin")
	public ModelAndView adminlogin()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminlogin");
		return mv;
	}
	
	@GetMapping("adminhome")
	public ModelAndView adminhome(HttpServletRequest request) {
	    HttpSession session = request.getSession(false); // Get existing session, don't create a new one
	    if (session == null || session.getAttribute("admin") == null) {
	        return new ModelAndView("redirect:/adminlogin"); // Redirect to login if session is invalid
	    }
	    
	    ModelAndView mv = new ModelAndView("adminhome");
	    long count = adminService.usercount();
	    mv.addObject("count", count);
	    return mv;
	}
	
	
	@PostMapping("checkadminlogin")
	public ModelAndView checkadminlogin(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();
	    String auname = request.getParameter("auname");
	    String apwd = request.getParameter("apwd");

	    Admin admin = adminService.checkAdminLogin(auname, apwd);

	    if (admin != null) {
	        HttpSession session = request.getSession(true); // Create new session
	        session.setAttribute("admin", admin); // Store admin details in session
	        mv.setViewName("adminhome");

	        long count = adminService.usercount();
	        mv.addObject("count", count);
	    } else {
	        mv.setViewName("adminloginfail");
	        mv.addObject("message", "Login Failed");
	    }
	    return mv;
	}

	
	@GetMapping("logout")
	public String logout(HttpServletRequest request) {
	    HttpSession session = request.getSession(false);
	    if (session != null) {
	        session.invalidate(); // Invalidate the session
	    }
	    return "redirect:/adminlogin"; // Redirect to login page
	}

	
	@GetMapping("viewallusers")
	public ModelAndView viewallusers()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewallusers");
		
		long count = adminService.usercount();
		mv.addObject("count", count);
		
		List<User> users = adminService.viewAllUsers();
		mv.addObject("userlist", users);
		
		return mv;
	}
	
	@GetMapping("deleteuser")
	public ModelAndView deleteuser()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("deleteuser");
		
		
		List<User> users = adminService.viewAllUsers();
		mv.addObject("userlist", users);
		
		return mv;
	}
	
	@GetMapping("delete")
	public String delete(@RequestParam int id)
	{
		adminService.deleteUser(id);
		return "redirect:/deleteuser";
	}
	
	@GetMapping("viewuserbyid")
	public ModelAndView viewuserbyid()
	{
		ModelAndView mv = new ModelAndView();

		List<User> users = adminService.viewAllUsers();
		mv.addObject("userlist", users);
		
		mv.setViewName("viewuserbyid");
		return mv;
	}
	
	@PostMapping("displayuser")
	public ModelAndView displayuser(HttpServletRequest request)
	{
		int id = Integer.parseInt(request.getParameter("id"));
		
		User user = adminService.displayUserById(id);
		
		ModelAndView mv = new ModelAndView("displayuser");
		mv.addObject("u",user);
		
		return mv;
	}

    // Other methods for login and user management

    @GetMapping("/uploadmarks")
    public ModelAndView uploadMarksPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("uploadmarks");
        return mv;
    }

    @PostMapping("/uploadmarks")
    public ModelAndView uploadMarks(@RequestParam("file") MultipartFile file) {
        ModelAndView mv = new ModelAndView();
        String message = marksService.addMarksFromFile(file);
        mv.addObject("message", message);
        mv.setViewName("uploadmarksresult");
        return mv;
    }
    
    @GetMapping("/students-report")
    public String showStudentsReport(Model model) {
        // Add your model attributes here, e.g., fetching the list of students
        List<Marks> marksList = marksService.getAllMarks();
        model.addAttribute("marksList", marksList);
        return "students-report"; // The name of the JSP file without the .jsp extension
    }
    
    @GetMapping("/home")
    public String homePage(Model model) {
        return "home";  // This maps to home.jsp
    }
    
    @GetMapping("/feedback")
    public String showFeedbackPage() {
        return "feedback";  // This maps to feedback.jsp
    }

    @PostMapping("/submitfeedback")
    public String handlefeedback(@RequestParam("name") String name,
                                  @RequestParam("email") String email,
                                  @RequestParam("message") String message,
                                  Model model) {
        // You can store the feedback or send it to an email
        model.addAttribute("name", name);
        model.addAttribute("email", email);
        model.addAttribute("message", message);

        // Show confirmation page
        return "feedbacksuccess";  // This maps to feedbackSuccess.jsp
    }
}
