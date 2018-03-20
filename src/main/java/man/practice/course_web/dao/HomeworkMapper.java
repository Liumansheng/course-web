package man.practice.course_web.dao;

import man.practice.course_web.model.Homework;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HomeworkMapper {
    List<Homework> listPage(int first,int pageSize);
    int deleteByPrimaryKey(Integer id);

    int insert(Homework record);

    int insertSelective(Homework record);

    Homework selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Homework record);

    int updateByPrimaryKeyWithBLOBs(Homework record);

    int updateByPrimaryKey(Homework record);

    List<Homework> listAll();
}