package man.practice.course_web.service;

import man.practice.course_web.dao.FileMapper;
import man.practice.course_web.model.File;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

/**
 * Created by vvxc on 2017/6/29.
 */
@Transactional
@Service
public class FileService {
    @Autowired
    private FileMapper mapper;
    public List<File>listAll(){
       return mapper.listAll();

    }

    public void save(MultipartFile file, String fileName, String path) throws IOException {
        java.io.File targetFile = new java.io.File(path, fileName);
        if(targetFile.exists()){
            throw new IOException("文件已存在");
        }else{
            targetFile.mkdirs();
        }
        file.transferTo(targetFile);//使用SpringMVC框架将文件上传到服务器

        File databaseFile=new File();
        databaseFile.setFileName(fileName);
        databaseFile.setPath(path);
        mapper.insert(databaseFile);
    }

    public void deleteByIds(int[] ids) {
        for (int id:
             ids) {
            File file = mapper.selectByPrimaryKey(id);
            if (file!=null){

                java.io.File mFile=new java.io.File(file.getPath());
                mFile.delete();
                mapper.deleteByPrimaryKey(id);
            }
        }

    }

    public File findFileById(int id) {
        return mapper.selectByPrimaryKey(id);
    }
}
