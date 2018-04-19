package acheng1314.cn.domain;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;

/**
 * 权限管理
 */
@TableName("duty")
public class Duty extends Model<Duty> {
    private Long id;
    private String title;

    @Override
    protected Serializable pkVal() {
        return id;
    }

    @Override
    public String toString() {
        return "Duty{" +
                "id=" + id +
                ", title='" + title + '\'' +
                '}';
    }

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
}
