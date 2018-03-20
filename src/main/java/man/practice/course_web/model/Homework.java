package man.practice.course_web.model;

import java.util.Date;

public class Homework {
    private Integer id;

    private Date startTime;

    private Date endTime;

    private String content;

    public Homework(Integer id, Date startTime, Date endTime, String content) {
        this.id = id;
        this.startTime = startTime;
        this.endTime = endTime;
        this.content = content;
    }

    public Homework() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    @Override
    public String toString() {
        return "Homework{" +
                "id=" + id +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", content='" + content + '\'' +
                '}';
    }
}