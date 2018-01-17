package acheng1314.cn.dao


import acheng1314.cn.domain.User
import com.baomidou.mybatisplus.mapper.BaseMapper
import com.baomidou.mybatisplus.mapper.Wrapper
import org.apache.ibatis.annotations.*
import org.apache.ibatis.session.RowBounds
import org.springframework.stereotype.Repository


/**
 * Created by pc on 2017/8/11.
 */
@Repository("userDao")
interface UserDao : BaseMapper<User> {

    @Select("SELECT * FROM `cc_user`")
    fun findAll(): List<User>

    @Select("SELECT * FROM `cc_user` where `login_name` = #{key}")
    fun findOneByKey(@Param("key") key: String): User

    @Update("UPDATE `cc_user` SET `used` = 0 where `login_name` = #{key}")
    fun delUser(@Param("key") key: String)

    @Insert("INSERT `cc_user` " +
            "(`name`,`login_name`, `password`, `duty`, `create_date`, `used`)" +
            "    VALUES (#{name}, #{loginName}, #{password}, #{duty}, #{createDate}, #{used});")
    @SelectKey(statement = arrayOf("SELECT LAST_INSERT_ID()"), keyProperty = "id", before = false, resultType = Long::class)
    fun addUser(user: User)

    override fun selectPage(rowBounds: RowBounds, wrapper: Wrapper<User>): List<User>

    fun selectNotUsed(): List<User>
}
