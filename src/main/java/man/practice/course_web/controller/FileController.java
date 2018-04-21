package man.practice.course_web.controller;

import man.practice.course_web.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;


@RequestMapping("/file")
@Controller
public class FileController {
    @Autowired
    private FileService service;

    @RequestMapping("/admin/upload")
    public @ResponseBody String upload(@RequestParam(value = "myfile", required = false) MultipartFile myfile, HttpServletRequest request){
        System.out.println("开始");
        String path = request.getSession().getServletContext().getRealPath("upload");//获取要上传到的服务器路径
        String fileName = myfile.getOriginalFilename();//获取文件名
//        String fileName = new Date().getTime()+".jpg";

        try {
            service.save(myfile,fileName,path);
        } catch (IOException e) {
            e.printStackTrace();
            return "{\"code\":\"1\"}";
        }
        return "{\"code\":\"0\"}";
    }

    @RequestMapping("/download")
    public ResponseEntity<byte[]> download(HttpServletRequest request,int id) throws IOException {
        man.practice.course_web.model.File mfile=service.findFileById(id);
        String path=mfile.getPath()+File.separator+mfile.getFileName();

        File file = new File(path);
        byte[] body = null;
        InputStream is = new FileInputStream(file);
        body = new byte[is.available()];
        is.read(body);
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Disposition","attachment; filename=\"" + new String(file.getName().getBytes("gbk"),"iso-8859-1") + "\"");
        HttpStatus statusCode = HttpStatus.OK;
        ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(body, headers, statusCode);
        return entity;
    }
    @RequestMapping(value = {"/admin"})
    public String index(){
        return "/file_manage";
    }

    @RequestMapping("/listAll")
    public @ResponseBody List<man.practice.course_web.model.File> listAll(){
        return service.listAll();
    }

    @RequestMapping("/admin/deleteByIds")
    public @ResponseBody String deleteByIds(@RequestParam(value = "ids[]") int[] ids){
        try{
            service.deleteByIds(ids);
        }catch (Exception e){
            e.printStackTrace();
            return "{1}";
        }
        return "{0}";
    }

    @RequestMapping(value = {"/",""})
    public String downloadPage(){
        return "file_download";
    }
}
