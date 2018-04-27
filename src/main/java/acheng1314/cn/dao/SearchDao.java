package acheng1314.cn.dao;

import acheng1314.cn.domain.Search;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository("searchDao")
public interface SearchDao extends BaseMapper<Search> {

    @Select("select * from `search` where `keyword` like #{q} and `date` like #{date} and `type` = 'q' group by `id` desc limit 1;")
    Search findLastQ(@Param(value = "q") String q, @Param("date") String date);

    @Select("select * from `search` where `keyword` like #{tag} and `date` like #{date} and `type` = 'tag'  group by `id` desc limit 1;")
    Search findLastTag(@Param(value = "tag") String tag, @Param("date") String date);
}
