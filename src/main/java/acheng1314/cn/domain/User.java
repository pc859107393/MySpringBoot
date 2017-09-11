package acheng1314.cn.domain;


import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import io.swagger.annotations.ApiParam;

import java.io.Serializable;

/**
 * Created by pc on 2017/8/11.
 *
 * @version v1 <br/>
 * 数据库表：cc_user
 */
@TableName(value = "cc_user")
public class User extends Model<User> {
    @ApiParam(required = false)
    private Long id;
    @ApiParam(required = true)
    private String name;
    //    @TableField(value = "login_name")
    @ApiParam(required = true)
    private String loginName;
    @ApiParam(required = true)
    private String password;
    private String duty;
    //    @TableField(value = "create_date")
    private Integer createDate;
    private Boolean used = true;

    public User() {
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    /**
     * 创建用户对象
     *
     * @param name       昵称
     * @param loginName  登录名字
     * @param password   密码
     * @param duty       职位
     * @param createDate 创建时间（int）<br/>
     *                   used  是否可用，默认=true=1
     */
    public User(String name, String loginName, String password, String duty, Integer createDate) {
        this.name = name;
        this.loginName = loginName;
        this.password = password;
        this.duty = duty;
        this.createDate = createDate;
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

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
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

    public Integer getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Integer createDate) {
        this.createDate = createDate;
    }

    public boolean isUsed() {
        return used;
    }

    public void setUsed(boolean used) {
        this.used = used;
    }

    @Override
    public String toString() {
        return "UserDao{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", loginName='" + loginName + '\'' +
                ", password='" + password + '\'' +
                ", duty='" + duty + '\'' +
                ", createDate=" + createDate +
                ", used=" + used +
                '}';
    }
}
