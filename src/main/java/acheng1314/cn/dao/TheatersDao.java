package acheng1314.cn.dao;


import acheng1314.cn.domain.Theaters;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository("theatersDao")
public interface TheatersDao extends BaseMapper<Theaters> {

    @Select("select * from `theaters` where `city` like #{city} and `date` like #{date}  and `start` like #{start} group by `id` desc limit 1;")
    Theaters findLastData(@Param("city") String city, @Param("date") String date, @Param(value = "start") Integer start);
}
