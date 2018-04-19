package acheng1314.cn.dao;

import acheng1314.cn.domain.Clazz;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

@Repository("classDao")
public interface ClassDao extends BaseMapper<Clazz> {
}
