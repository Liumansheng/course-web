package man.practice.course_web.controller;

/**
 * Created by man on 2018/2/25.
 */

import man.practice.course_web.model.Guestbook;
import man.practice.course_web.service.GuestbookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/guestbook")
public class GuestbookController {
    @Autowired
    private GuestbookService guestbookService;

    @RequestMapping("/list")
    public @ResponseBody List<Guestbook> listPage(int currentPage,int pageSize){

        return guestbookService.listPage((currentPage-1)*pageSize,pageSize);
    }
    @RequestMapping("/add")
    public @ResponseBody String addMessage(String content,String username,HttpServletRequest request){
        Guestbook guestbook=new Guestbook();
        guestbook.setContent(content);
        Object value=request.getSession().getAttribute("Student");
        if(value!=null){
        	username=value.toString();
        }
        if (username==null||"".equals(username)){
            guestbook.setUsername("游客");
        }else{
            guestbook.setUsername(username);
        }

        guestbook.setTime(new Date());

        try{
            guestbookService.add(guestbook);
        }catch (Exception e){
            return "{0}";
        }

        return "1";
    }
    @RequestMapping("/admin")
    public String admin(){
        return "admin/guestbook_manage";
    }

    @RequestMapping("/admin/deleteByIds")
    public @ResponseBody  String deleteByIds(@RequestParam(value = "ids[]") int[] ids){
        try{
            guestbookService.deleteByIds(ids);
        }catch (Exception e){
            return "{1}";
        }
        return "{0}";
    }
    
    @RequestMapping("/deleteById")
    public @ResponseBody  String deleteById(@RequestParam(value = "id") int id){
        try{
        	System.out.println(id);
            guestbookService.deleteById(id);
        }catch (Exception e){
            return "{1}";
        }
        return "{0}";
        
    }

    @RequestMapping("/listAll")
    public @ResponseBody List<Guestbook> listAll(){
        return guestbookService.listAll();
    }
}
