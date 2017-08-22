package acheng1314.cn.dao;


import acheng1314.cn.domain.User;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * Created by pc on 2017/8/11.
 */
@Repository("userDao")
public interface UserDao extends BaseMapper<User> {

    @Select("SELECT * FROM `cc_user`")
    List<User> findAll();

    @Select("SELECT * FROM `cc_user` where `login_name` = #{key}")
    User findOneByKey(@Param("key") String key);

    @Update("UPDATE `cc_user` SET `used` = 0 where `login_name` = #{key}")
    void delUser(@Param("key") String key);

    @Insert("INSERT `cc_user` " +
            "(`name`,`login_name`, `password`, `duty`, `create_date`, `used`)" +
            "    VALUES (#{name}, #{loginName}, #{password}, #{duty}, #{createDate}, #{used});")
    @SelectKey(statement = "SELECT LAST_INSERT_ID()"
            , keyProperty = "id"
            , before = false
            , resultType = long.class)
    void addUser(User user);

    @Override
    List<User> selectPage(RowBounds rowBounds, Wrapper<User> wrapper);

    List<User> selectNotUsed();
}
