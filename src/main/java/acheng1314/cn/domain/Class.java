package acheng1314.cn.domain;

import com.baomidou.mybatisplus.activerecord.Model;

import java.io.Serializable;
import java.util.Date;

/**
 * 课程
 */
public class Class extends Model<Class> {
    private Long id;
    private String title;
    private String content;
    private Date date;
    private Long userId;
    private String password;
    private String location;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Override
    public String toString() {
        return "Class{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", date=" + date +
                ", userId=" + userId +
                ", password='" + password + '\'' +
                ", location='" + location + '\'' +
                '}';
    }

    @Override
    protected Serializable pkVal() {
        return id;
    }
}
