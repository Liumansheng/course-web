package man.practice.course_web.model;

import java.util.Date;

public class Guestbook {
    private Integer id;

    private String username;

    private Date time;

    private String content;

    public Guestbook(Integer id, String username, Date time, String content) {
        this.id = id;
        this.username = username;
        this.time = time;
        this.content = content;
    }

    @Override
    public String toString() {
        return "Guestbook{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", time=" + time +
                ", content='" + content + '\'' +
                '}';
    }

    public Guestbook() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}