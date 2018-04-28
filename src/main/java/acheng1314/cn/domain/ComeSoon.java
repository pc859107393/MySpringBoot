package acheng1314.cn.domain;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

@TableName("come_soon")
public class ComeSoon extends Model<ComeSoon> {
    private Long id;
    private String data;
    private String date;
    private Integer start;

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "ComingSoon{" +
                "id=" + id +
                ", data='" + data + '\'' +
                ", date=" + date +
                '}';
    }

    @Override
    protected Serializable pkVal() {
        return id;
    }
}
