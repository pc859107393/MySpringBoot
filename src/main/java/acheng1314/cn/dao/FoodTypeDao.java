package acheng1314.cn.dao;

import acheng1314.cn.domain.FoodType;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

@Repository("foodTypeDao")
public interface FoodTypeDao extends BaseMapper<FoodType> {

    @SelectKey(statement = "SELECT LAST_INSERT_ID()"
            , keyProperty = "id"
            , before = false
            , resultType = Long.class)
    @Override
    Integer insert(FoodType entity);

    @Override
    Integer deleteById(Serializable id);

    @Override
    Integer updateById(FoodType entity);

    @Override
    List<FoodType> selectList(Wrapper<FoodType> wrapper);

    @Select("SELECT * FROM `cc_food_type` GROUP BY `id` DESC LIMIT #{offset}, #{limit};")
    List<FoodType> selectList(@Param("offset") int offset, @Param("limit") int limit);

    @Select("SELECT COUNT(*) FROM `cc_food_type`")
    int getCount();

    @Update("UPDATE `cc_food_type` SET `name` = #{name}" +
            ",`description` = #{description}" +
            ",`other`=#{other} WHERE id=#{id}")
    int update(FoodType entity);
}
