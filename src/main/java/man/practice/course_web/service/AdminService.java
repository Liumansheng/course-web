package man.practice.course_web.service;

import man.practice.course_web.dao.AdminMapper;
import man.practice.course_web.model.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class AdminService {
    @Autowired
    private AdminMapper mapper;

    public Admin login(String username,String pw){
        return  mapper.selectByUsernameAndPassword(username,pw);
    }
}
