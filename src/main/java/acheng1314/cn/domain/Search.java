package acheng1314.cn.domain;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;

@TableName("search")
public class Search extends Model<Search> {
    private Long id;
    private String type;
    private String data;
    private String date;
    private String keyword;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    @Override
    public String toString() {
        return "Search{" +
                "id=" + id +
                ", type='" + type + '\'' +
                ", data='" + data + '\'' +
                ", date='" + date + '\'' +
                ", keyword='" + keyword + '\'' +
                '}';
    }

    @Override
    protected Serializable pkVal() {
        return id;
    }
}
