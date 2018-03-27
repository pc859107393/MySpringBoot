package acheng1314.cn.dao

import acheng1314.cn.domain.BaseHouse
import com.baomidou.mybatisplus.mapper.BaseMapper
import com.baomidou.mybatisplus.plugins.pagination.Pagination
import org.apache.ibatis.annotations.Select
import org.apache.ibatis.annotations.SelectKey
import org.springframework.stereotype.Repository

@Repository("houseDao")
interface BaseHouseDao : BaseMapper<BaseHouse> {

    @Select("SELECT * FROM `cc_base_house` ORDER BY concat(`used`,`id`) DESC")
    fun findAllByPage(pagination: Pagination): ArrayList<BaseHouse>

    @SelectKey(statement = ["SELECT LAST_INSERT_ID()"], keyProperty = "id", before = false, resultType = Long::class)
    override fun insert(entity: BaseHouse?): Int
}