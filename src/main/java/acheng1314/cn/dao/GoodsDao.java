package acheng1314.cn.dao;

import acheng1314.cn.domain.Goods;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("goodsDao")
public interface GoodsDao extends BaseMapper<Goods> {

    @Insert("INSERT `cc_res`" +
            "  (`name`,`code`,`position`,`cost`,`sum`,`type`)" +
            "VALUES (#{name},#{code},#{position},#{cost},#{sum},#{type});")
    @SelectKey(statement = "SELECT LAST_INSERT_ID()"
            , keyProperty = "id"
            , before = false
            , resultType = Long.class)
    void addOneGoods(Goods goods);

    @Update("UPDATE  `cc_res` SET `sum`=#{sum} where `id`=#{id}")
    void updateSum(@Param("sum") Integer sum, @Param("id") Long id);

    @Update("UPDATE  `cc_res` SET `sum`=#{cost} where `id`=#{id}")
    void updateCost(@Param("sum") Float cost, @Param("id") Long id);

    @Select("SELECT * FROM `cc_res` WHERE " +
            "`name` Like '%${keyword}%' " +
            "OR `code` LIKE '%${keyword}%' " +
            "OR `type` LIKE '%${keyword}%';")
    List<Goods> selectByKeyword(@Param("keyword") String keyword);


}
