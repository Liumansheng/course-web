package man.practice.course_web.controller;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import man.practice.course_web.model.Homework;
import man.practice.course_web.service.HomeworkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by vvxc on 2017/6/24.
 */
@Controller
@RequestMapping("/homework")
public class HomeworkController {


    @Autowired
    private HomeworkService homeworkService;

    @RequestMapping("/list")
    public @ResponseBody List<Homework> listHomework(int currentPage,int pageSize){
        return homeworkService.listHomework((currentPage-1)*pageSize,pageSize);
    }

    @RequestMapping("/listAll")
    public @ResponseBody List<Homework> listAll(){
        return homeworkService.listAll();
    }

    @RequestMapping("/admin")
    public String admin(){
        return "admin/homework_manage";
    }

    @RequestMapping("/admin/deleteByIds")
    public @ResponseBody  String deleteByIds(@RequestParam(value = "ids[]")int[] ids){
        try{
            homeworkService.deleteByIds(ids);
        }catch (Exception e){
            e.printStackTrace();
            return "{1}";
        }

        return "{0}";
    }

    @RequestMapping("/admin/add")
    public @ResponseBody String add(String startTime,String endTime,String content) throws ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Homework homework=new Homework();
        homework.setContent(content);
        homework.setStartTime(simpleDateFormat.parse(startTime));
        homework.setEndTime(simpleDateFormat.parse(endTime));

        try{
            homeworkService.add(homework);
        }catch (Exception e){
            e.printStackTrace();
            return "{1}";
        }
        return "{0}";
    }
}
