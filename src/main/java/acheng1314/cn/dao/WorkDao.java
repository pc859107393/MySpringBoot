package acheng1314.cn.dao;

import acheng1314.cn.domain.Works;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository("workDao")
public interface WorkDao extends BaseMapper<Works> {

    @Select("SELECT * FROM `works` ORDER BY `id` DESC")
    ArrayList<Works> findAll(Pagination pagination);

    @Select("SELECT * FROM `works` where `user_id`=#{userId} ORDER BY `id` DESC")
    ArrayList<Works> findAllByPage(Pagination pagination, @Param("userId") Long userId);

    @Select("SELECT * FROM `works` where `score` is null ORDER BY `id` DESC")
    ArrayList<Works> findNotRead();


    @Select("SELECT * FROM `works` where `score` is not null ORDER BY `id` DESC")
    ArrayList<Works> findRead();
}
