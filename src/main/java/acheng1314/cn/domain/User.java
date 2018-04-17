package acheng1314.cn.domain;


import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import io.swagger.annotations.ApiParam;

import java.io.Serializable;

/**
 * create table user
 * (
 * id int auto_increment comment '人员的ID信息，自增主键'
 * primary key,
 * name text not null comment '用户姓名',
 * tel text not null comment '手机号',
 * sex tinyint not null comment '性别',
 * duty text not null comment '职务，对应权限的ID列表',
 * password text not null comment '用户密码',
 * constraint user_id_uindex
 * unique (id)
 * )
 * comment '人员信息表';
 */
@TableName(value = "user")
public class User extends Model<User> {
    @ApiParam(required = false)
    private Long id;
    private String name;
    @ApiParam(required = true)
    private String tel;
    @ApiParam(required = true)
    private String password;
    private String duty;
    private String sex;
    private String type;

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDuty() {
        return duty;
    }

    public void setDuty(String duty) {
        this.duty = duty;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", tel='" + tel + '\'' +
                ", password='" + password + '\'' +
                ", duty='" + duty + '\'' +
                ", sex='" + sex + '\'' +
                '}';
    }
}
