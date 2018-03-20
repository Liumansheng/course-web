package man.practice.course_web.dao;

import man.practice.course_web.model.Guestbook;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GuestbookMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Guestbook record);

    int insertSelective(Guestbook record);

    Guestbook selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Guestbook record);

    int updateByPrimaryKeyWithBLOBs(Guestbook record);

    int updateByPrimaryKey(Guestbook record);

    List<Guestbook> listPage(int start, int pageSzie);

    List<Guestbook> listAll();
}