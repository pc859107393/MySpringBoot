package acheng1314.cn.dao;

import acheng1314.cn.domain.Top;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository("topDao")
public interface TopDao extends BaseMapper<Top> {


    @Select("select * from `top` where `date` like #{date} group by `id` desc limit 1;")
    Top findLast(@Param("date") String date);
}
