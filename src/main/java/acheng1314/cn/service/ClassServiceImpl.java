package acheng1314.cn.service;

import acheng1314.cn.dao.ClassDao;
import acheng1314.cn.domain.Clazz;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service("classService")
public class ClassServiceImpl extends ServiceImpl<ClassDao, Clazz> {
}
