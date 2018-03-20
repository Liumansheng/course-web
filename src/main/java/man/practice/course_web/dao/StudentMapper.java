package man.practice.course_web.dao;

import org.springframework.stereotype.Repository;
import man.practice.course_web.model.Student;

@Repository
public interface StudentMapper {
	     int deleteByPrimaryKey(Integer id);

	    int insert(Student record);

	    int insertSelective(Student record);

	    Student selectByPrimaryKey(Integer id);

	    Student selectByUsernameAndPassword(String username,String password);

	    int updateByPrimaryKeySelective(Student record);

	    int updateByPrimaryKey(Student record);

		Student selectByUsername(String name);

}
