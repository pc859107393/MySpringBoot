package acheng1314.cn.domain;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;

@TableName("cc_food")
public class Food extends Model<Food> {
    private Integer id;
    private Integer status = 1;
    private String name;
    private String avatar;
    private String content;
    private String style;
    private String type;

    @Override
    protected Serializable pkVal() {
        return id;
    }

    @Override
    public String toString() {
        return "Food{" +
                "id=" + id +
                ", status=" + status +
                ", name='" + name + '\'' +
                ", avatar='" + avatar + '\'' +
                ", content='" + content + '\'' +
                ", style='" + style + '\'' +
                ", type='" + type + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
