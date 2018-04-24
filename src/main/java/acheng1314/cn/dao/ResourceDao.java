package acheng1314.cn.dao;

import acheng1314.cn.domain.Resource;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository("resourceDao")
public interface ResourceDao extends BaseMapper<Resource> {
    @Select("SELECT * FROM `resource` ORDER BY `id` DESC")
    ArrayList<Resource> findAllByPage(Pagination pagination);
}
