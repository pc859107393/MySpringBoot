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

    @Select("SELECT * FROM `user`")
    List<User> findAll();

    @Select("SELECT * FROM `user` where `tel` = #{key}")
    User findOneByKey(@Param("key") String key);

    @Update("UPDATE `user` SET `used` = 0 where `tel` = #{key}")
    void delUser(@Param("key") String key);

    @Insert("INSERT `user` " +
            "(`name`, `password`, `duty`, `tel`, `sex`, `type`)" +
            "    VALUES (#{name}, #{password}, #{duty}, #{tel}, #{sex}, #{type});")
    @SelectKey(statement = "SELECT LAST_INSERT_ID()"
            , keyProperty = "id"
            , before = false
            , resultType = Long.class)
    void addUser(User user);

    @Override
    List<User> selectPage(RowBounds rowBounds, Wrapper<User> wrapper);

    List<User> selectNotUsed();
}
