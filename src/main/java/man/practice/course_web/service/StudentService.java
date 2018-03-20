package man.practice.course_web.service;

import man.practice.course_web.dao.StudentMapper;
import man.practice.course_web.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class StudentService {
    @Autowired
    private StudentMapper mapper;

    public Student login(String username,String pw){
        return  mapper.selectByUsernameAndPassword(username,pw);
    }
    public void add(Student student){
    	  mapper.insert(student);
    }
    
    public Student findByname(String name){
    	return mapper.selectByUsername(name);
    	
    }
}
