package man.practice.course_web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import man.practice.course_web.model.Student;
import man.practice.course_web.service.StudentService;

@Controller
@RequestMapping(value = {"/student"})
public class StudentController {
	 @Autowired
	    private StudentService StudentService;

	    @RequestMapping("/logins")
	    public @ResponseBody String login(String username, String password, HttpServletRequest request){
	    	try {
				request.setCharacterEncoding("utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	System.out.println(username+password);
	        Student student=StudentService.login(username,password);
	        if (student==null){
	            return "{\"code\":\"1\",\"msg\":\"登录失败\"}";
	        }else{
	            request.getSession().setAttribute("Student",student.getUsername());
	        }
	       
	        return "{\"code\":\"0\"}";
	    }

	  

	    @RequestMapping("logout")
	    public String logout(HttpServletRequest request){
	        request.getSession().setAttribute("Student",null);
	        return "redirect:/";
	    }
	    
	    @RequestMapping("register")
	    public String register(String name,String email,String password,HttpServletRequest request){
	    	try {
	    		request.setCharacterEncoding("utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
	    	Student student=new Student();
	    	student.setUsername(name);
	    	student.setEmail(email);
	    	student.setPassword(password);
	    	System.out.println(name+"111");
	    	StudentService.add(student);
	    	
	            request.getSession().setAttribute("Student",name);
	      
	        return "redirect:/";
	    }
	    @RequestMapping("findByName")
	    public String findByName(String name,HttpServletRequest request,HttpServletResponse response) {
			// 调用Service进行查询:
			Student existUser = StudentService.findByname(name);
			// 获得response对象,项页面输出:
			//System.out.println(existUser.getUsername()+"123");
			System.out.println(name);
			response.setContentType("text/html;charset=UTF-8");
			// 判断
			if (existUser != null) {
				// 查询到该用户:用户名已经存在
				try {
					System.out.println("existUser");
					response.getWriter().println("<font color='red'>用户名已经存在</font>");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				// 没查询到该用户:用户名可以使用
				try {
					
					
					response.getWriter().println("<font color='green'>用户名可以使用</font>");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return null;
		}
	    
	    
//	    @RequestMapping("register")
//	    public String register(String name,String email,String password, HttpServletRequest request){
//	    	System.out.println("this is for register");
//	    	Student student=new Student();
//	    	student.setName(name);
//	    	student.setEmail(email);
//	    	student.setPassword(password);
//	    	StudentService.add(student);
//	    	HttpServletResponse response = null;
//	    	response.setContentType("text/html; charset=utf-8");
//	    	PrintWriter writer = null;
//			try {
//				writer = response.getWriter();
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			System.out.println(name+"+"+email+"passsword"+password);
//	    	writer.write("<script>alert('注册成功');</script>");
//	    	writer.close();
//	    	writer.flush();
//	    	return "";
//	    	
//	      
//	    }

}
