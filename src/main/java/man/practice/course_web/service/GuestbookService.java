package man.practice.course_web.service;

import man.practice.course_web.dao.GuestbookMapper;
import man.practice.course_web.model.Guestbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by vvxc on 2017/6/25.
 */
@Service
@Transactional
public class GuestbookService {
    @Autowired
    private GuestbookMapper guestbookMapper;

    public List<Guestbook> listPage(int start,int pageSzie){
        return guestbookMapper.listPage(start,pageSzie);
    }

    public void add(Guestbook guestbook){
        guestbookMapper.insert(guestbook);
    }

    public void deleteByIds(int[] ids) {
        for (int id:
             ids) {
            guestbookMapper.deleteByPrimaryKey(id);
        }

    }

    public List<Guestbook> listAll() {
        return guestbookMapper.listAll();
    }
}
