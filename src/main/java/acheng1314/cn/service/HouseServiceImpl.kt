package acheng1314.cn.service

import acheng1314.cn.dao.BaseHouseDao
import acheng1314.cn.domain.BaseHouse
import com.baomidou.mybatisplus.plugins.pagination.Pagination
import com.baomidou.mybatisplus.service.impl.ServiceImpl
import org.springframework.stereotype.Service
import javax.validation.Valid

@Service("houseService")
class HouseServiceImpl : ServiceImpl<BaseHouseDao, BaseHouse>() {

    @Throws(Exception::class)
    fun saveBaseHouse(@Valid data: BaseHouse) {
        try {
            baseMapper.insert(data)
        } catch (e: Exception) {
            throw Exception(e.message)
        }
    }

    fun findAllByPage(pageNum: Int, pageSize: Int): ArrayList<BaseHouse>? = try {
        val pagination = Pagination(pageNum, pageSize)
        setTotalPage(pagination.pages)
        baseMapper.findAllByPage(pagination)
    } catch (e: Exception) {
        null
    }

    var totalPage: Int? = null
    fun setTotalPage(pages: Int) {
        this.totalPage = pages
    }

}