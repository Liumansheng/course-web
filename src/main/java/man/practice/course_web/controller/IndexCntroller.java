package man.practice.course_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by vvxc on 2017/6/24.
 */
@Controller
public class IndexCntroller {
    @RequestMapping(value = {"/","/index"})
    public String index(){
        return "index";
    }
}
