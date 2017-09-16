package acheng1314.cn.dao;

import acheng1314.cn.domain.Desk;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("deskDao")
public interface DeskDao extends BaseMapper<Desk> {

    int insertSelective(@Param("pojo") Desk pojo);

    int insertList(@Param("pojos") List<Desk> pojo);

    int update(@Param("pojo") Desk pojo);

    @Select("SELECT * FROM `cc_desk` WHERE status!='0' GROUP BY `id` DESC LIMIT #{offset}, #{limit};")
    List<Desk> selectList(@Param("offset") int offset, @Param("limit") int limit);

    @Select("SELECT COUNT(*) FROM `cc_desk` WHERE status!='0';")
    int getCount();

    @Update("UPDATE `cc_desk` SET `status` = '0' WHERE `id`= #{id};")
    void delDesk4Id(Integer id);
}
