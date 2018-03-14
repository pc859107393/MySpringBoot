package acheng1314.cn.dao

import acheng1314.cn.domain.Guard
import com.baomidou.mybatisplus.mapper.BaseMapper
import org.apache.ibatis.annotations.Select
import org.springframework.stereotype.Repository

@Repository("guardDao")
interface GuardDao : BaseMapper<Guard> {

    @Select("SELECT * FROM `cc_guard` ORDER BY `id` DESC LIMIT 1")
    fun findLast(): Guard

}