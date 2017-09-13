package acheng1314.cn.dao;

import acheng1314.cn.domain.Food;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("foodDao")
public interface FoodDao extends BaseMapper<Food> {

    //    @Insert("INSERT INTO `cc_food` " +
//            "VALUES (#{id}, #{name}, #{avatar}, #{content}, #{style}, #{type})")
    @SelectKey(statement = "SELECT LAST_INSERT_ID()"
            , keyProperty = "id"
            , before = false
            , resultType = Long.class)
    @Override
    Integer insert(Food entity);

    @Select("SELECT * FROM `cc_food` WHERE status!='0' GROUP BY `id` DESC LIMIT #{offset}, #{limit};")
    List<Food> selectList(@Param("offset") int offset, @Param("limit") int limit);

    @Select("SELECT COUNT(*) FROM `cc_food` WHERE status!='0';")
    int getCount();

    @Update("UPDATE `cc_food` SET status='0' WHERE id=#{id}")
    void deleteOneById(Integer id);

}
