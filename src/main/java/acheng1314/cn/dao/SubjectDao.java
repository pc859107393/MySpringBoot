package acheng1314.cn.dao;

import acheng1314.cn.domain.Subject;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository("subjectDao")
public interface SubjectDao extends BaseMapper<Subject> {

    @Insert("insert into `subject` values (#{id},#{data});")
    Integer insert(@Param(value = "id") Long id, @Param("data") String data);
}
