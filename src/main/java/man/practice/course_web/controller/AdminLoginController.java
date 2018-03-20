package man.practice.course_web.controller;

import man.practice.course_web.model.Admin;
import man.practice.course_web.service.AdminService;
import man.practice.course_web.util.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping(value = {"/admin"})
public class AdminLoginController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/login")
    public @ResponseBody String login(String username, String password, HttpServletRequest request){
        Admin admin=adminService.login(username,password);
        if (admin==null){
            return "{\"code\":\"1\",\"msg\":\"登陆失败\"}";
        }else{
            request.getSession().setAttribute("admin",admin);
        }
        return "{\"code\":\"0\"}";
    }

    @RequestMapping(value = {"/",""})
    public String index(){
        return "login";
    }

    @RequestMapping("logout")
    public String logout(HttpServletRequest request){
        request.getSession().setAttribute("admin",null);
        return "redirect:/course-web/admin";
    }
}
