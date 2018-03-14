package acheng1314.cn.service

import acheng1314.cn.dao.GuardDao
import acheng1314.cn.domain.Guard
import com.baomidou.mybatisplus.service.impl.ServiceImpl
import org.springframework.stereotype.Service

@Service(value = "guardService")
class GuardServiceImpl : ServiceImpl<GuardDao, Guard>() {

    /**
     * 查找最近一个Guard
     * @return Guard 返回最近一条
     */
    val findLast: Guard
        get() = baseMapper.findLast()


}