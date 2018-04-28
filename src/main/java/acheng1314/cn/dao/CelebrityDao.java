package acheng1314.cn.dao;

import acheng1314.cn.domain.Celebrity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository("celebrityDao")
public interface CelebrityDao extends BaseMapper<Celebrity> {

    @Insert("insert into `celebrity` values (#{id},#{data});")
    Integer insert(@Param(value = "id") Long id, @Param("data") String data);
}
