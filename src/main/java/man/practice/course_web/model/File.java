package man.practice.course_web.model;

public class File {
    private Integer id;

    private String path;

    private String fileName;

    public File(Integer id, String path, String fileName) {
        this.id = id;
        this.path = path;
        this.fileName = fileName;
    }

    public File() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path == null ? null : path.trim();
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName == null ? null : fileName.trim();
    }
}