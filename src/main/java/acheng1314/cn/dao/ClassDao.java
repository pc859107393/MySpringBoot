package acheng1314.cn.dao;

import acheng1314.cn.domain.Clazz;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository("classDao")
public interface ClassDao extends BaseMapper<Clazz> {
    @Select("SELECT * FROM `class` ORDER BY `id` DESC")
    ArrayList<Clazz> findAllByPage(Pagination pagination);
}
