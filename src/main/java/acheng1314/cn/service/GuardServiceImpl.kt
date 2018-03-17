package acheng1314.cn.service

import acheng1314.cn.dao.GuardDao
import acheng1314.cn.domain.Guard
import acheng1314.cn.util.StringUtils
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

    @Throws(Exception::class)
    override fun insert(entity: Guard?): Boolean {
        if (entity != null) {
            if (StringUtils.isEmpty(entity.title)) throw Exception("标题不能为空")
            if (StringUtils.isEmpty(entity.content)) throw Exception("内容不能为空")
            return super.insert(entity)
        } else throw Exception("特色信息不能为空")
    }
}