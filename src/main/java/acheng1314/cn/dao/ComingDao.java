package acheng1314.cn.dao;

import acheng1314.cn.domain.ComeSoon;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository("comingDao")
public interface ComingDao extends BaseMapper<ComeSoon> {

    @Select("select * from `come_soon` where `date` like #{date} and `start` like #{start} group by `id` desc limit 1;")
    ComeSoon findLast(@Param("date") String date, @Param(value = "start") Integer start);
}
