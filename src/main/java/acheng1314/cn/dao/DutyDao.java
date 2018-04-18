package acheng1314.cn.dao;

import acheng1314.cn.domain.Duty;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository("dutyDao")
public interface DutyDao extends BaseMapper<Duty> {
    @Select("SELECT * FROM `duty`")
    ArrayList<Duty> selectAll();
}
