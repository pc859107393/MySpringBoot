package acheng1314.cn.dao

import acheng1314.cn.domain.Banner
import com.baomidou.mybatisplus.mapper.BaseMapper
import org.apache.ibatis.annotations.Select
import org.springframework.stereotype.Repository

@Repository(value = "bannerDao")
interface BannerDao : BaseMapper<Banner> {

    @Select("SELECT * FROM `cc_banner`")
    fun findAll(): ArrayList<Banner>
}