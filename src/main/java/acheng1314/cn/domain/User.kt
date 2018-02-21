package acheng1314.cn.domain


import com.baomidou.mybatisplus.activerecord.Model
import com.baomidou.mybatisplus.annotations.TableName
import io.swagger.annotations.ApiParam
import java.io.Serializable

/**
 * Created by pc on 2017/8/11.
 *
 * @version v1 <br></br>
 * 数据库表：cc_user
 */
@TableName(value = "cc_user")
class User : Model<User> {
    @ApiParam(required = false)
    var id: Long? = null
    @ApiParam(required = true)
    var name: String? = null
    //    @TableField(value = "login_name")
    @ApiParam(required = true)
    var loginName: String? = null
    @ApiParam(required = true)
    var password: String? = null
    var duty: String? = null
    //    @TableField(value = "create_date")
    var createDate: Int? = null
    private var used: Boolean? = false

    var isUsed: Boolean
        get() = used!!
        set(used) {
            this.used = used
        }

    constructor()

    override fun pkVal(): Serializable? {
        return this.id
    }

    /**
     * 创建用户对象
     *
     * @param name       昵称
     * @param loginName  登录名字
     * @param password   密码
     * @param duty       职位
     * @param createDate 创建时间（int）<br></br>
     * used  是否可用，默认=true=1
     */
    constructor(name: String, loginName: String, password: String, duty: String, createDate: Int?) {
        this.name = name
        this.loginName = loginName
        this.password = password
        this.duty = duty
        this.createDate = createDate
    }

}
